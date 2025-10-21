require 'minitest/autorun'
require 'apimatic_faraday_client_adapter'
require_relative '../test-helper/mock_helper'
require_relative '../test-helper/servers/local_server'
require_relative '../test-helper/servers/proxy_server'
require 'ostruct'

class FaradayClientTest < Minitest::Test
  include CoreLibrary, TestComponent, LocalServer

  def setup
    @client_configuration = MockHelper.create_client_configuration
    @client_configuration_with_alternate_setting = MockHelper.create_client_configuration timeout: -1,
                                                                                          cache: true,
                                                                                          verify: false

    @custom_connection = MockHelper.create_mock_connection
    @client_configuration_with_custom_setting = MockHelper.create_client_configuration connection: @custom_connection,
                                                                                       cache: true, verify: false
  end

  def teardown
  end

  def test_create_connection

    faraday_client = FaradayClient.new @client_configuration_with_alternate_setting

    actual_connection = faraday_client.create_connection @client_configuration_with_alternate_setting


    refute_nil actual_connection
  end

  def test_execute_get
    request_mock = MockHelper.create_request http_method: HttpMethod::GET, query_url: '/get',
                                             headers: {"accept" => "text/plain"}

    faraday_client = FaradayClient.new @client_configuration_with_custom_setting

    actual_response = faraday_client.execute request_mock
    expected_response = MockHelper.create_response status_code: 200, headers: {"Content-type" => "text/plain"},
                                                   raw_body: "Get response body.",
                                                   request: request_mock


    refute_nil actual_response

    assert_equal expected_response.status_code, actual_response.status_code
    assert_equal expected_response.headers, actual_response.headers
    assert_equal expected_response.raw_body, actual_response.raw_body
    assert_equal expected_response.request, actual_response.request

  end

  def test_execute_put
    request_mock = MockHelper.create_request http_method: HttpMethod::PUT, query_url: '/put',
                                             headers: {"accept" => "text/plain"},
                                             parameters: {"body" => "This is simple body."}

    faraday_client = FaradayClient.new @client_configuration_with_custom_setting

    actual_response = faraday_client.execute request_mock
    expected_response = MockHelper.create_response status_code: 200, headers: {"Content-type" => "text/plain"},
                                                   raw_body: "Put response body.",
                                                   request: request_mock


    refute_nil actual_response

    assert_equal expected_response.status_code, actual_response.status_code
    assert_equal expected_response.headers, actual_response.headers
    assert_equal expected_response.raw_body, actual_response.raw_body
    assert_equal expected_response.request, actual_response.request

  end

  def test_execute_connection_failure_response
    request_mock = MockHelper.create_request http_method: HttpMethod::GET, query_url: '/boom',
                                             headers: {"accept" => "text/plain"},
                                             parameters: {"body" => "This is simple body."},
                                             context: {'forced_retry' => true}

    faraday_client = FaradayClient.new @client_configuration_with_custom_setting

    assert_raises Faraday::ConnectionFailed do
      faraday_client.execute request_mock
    end

  end

  def test_convert_response

    request_mock = MockHelper.create_request http_method: HttpMethod::GET, query_url: '/test',
                                             headers: {"Content-type" => "text/plain"},
                                             parameters: {"body" => "This is simple body."}

    faraday_response_mock = MockHelper.create_faraday_response status: 200,
                                                               reason_phrase: "This is simple reason phrase.",
                                                               headers: {"Content-type" => "text/plain"},
                                                               body: "This is simple string response."
    faraday_client = FaradayClient.new @client_configuration
    actual_response = faraday_client.convert_response faraday_response_mock, request_mock

    expected_response = MockHelper.create_response status_code: 200, reason_phrase: "This is simple reason phrase.",
                                                   headers: {"Content-type" => "text/plain"},
                                                   raw_body: "This is simple string response.",
                                                   request: request_mock

    refute_nil actual_response

    assert_equal expected_response.status_code, actual_response.status_code
    assert_equal expected_response.reason_phrase, actual_response.reason_phrase
    assert_equal expected_response.headers, actual_response.headers
    assert_equal expected_response.raw_body, actual_response.raw_body
    assert_equal expected_response.request, actual_response.request
  end

  def test_execute_get_through_proxy
    @proxy_server = ProxyServer.new(port: 8881)
    @proxy_server.start

    LocalServer.start(8081)

    proxy_settings = MockHelper::ProxySettingsStruct.new('http://localhost:8881')

    config = MockHelper.create_client_configuration(
      proxy_settings: proxy_settings,
      verify: false
    )

    request_mock = MockHelper.create_request(
      http_method: HttpMethod::GET,
      query_url: 'http://localhost:8081/get',
      headers: { 'accept' => 'text/plain' }
    )

    faraday_client = FaradayClient.new(config)
    response = faraday_client.execute(request_mock)

    assert_equal 200, response.status_code
    assert_equal 'Get response body.', response.raw_body
    @proxy_server.stop
  end

  def test_execute_get_through_proxy_with_auth
    auth_proxy_server = ProxyServer.new(port: 8882, auth: 'user:pass')
    auth_proxy_server.start

    LocalServer.start(8082)

    proxy_settings = MockHelper::ProxySettingsStruct.new('http://localhost:8882', 'user', 'pass')

    config = MockHelper.create_client_configuration(
      proxy_settings: proxy_settings,
      verify: false
    )

    request_mock = MockHelper.create_request(
      http_method: HttpMethod::GET,
      query_url: 'http://localhost:8082/get',
      headers: { 'accept' => 'text/plain' }
    )

    faraday_client = FaradayClient.new(config)
    response = faraday_client.execute(request_mock)

    assert_equal 200, response.status_code
    assert_equal 'Get response body.', response.raw_body
    auth_proxy_server.stop
  end
end
