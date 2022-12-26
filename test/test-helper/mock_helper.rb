require_relative 'http/external/faraday_response'
require_relative 'http/internal/http_request'
require_relative 'http/internal/http_response'
require_relative 'http/internal/http_client_configuration'

module TestComponent
  class MockHelper
    include CoreLibrary

    def self.create_client_configuration(connection: nil, timeout: 60, cache: false, verify: true)
      HttpClientConfigurationMock.new connection:connection, timeout: timeout, cache:cache, verify: verify
    end

    def self.create_response(status_code: nil, reason_phrase: nil, headers: nil, raw_body: nil, request: nil)
      HttpResponseMock.new(status_code, reason_phrase, headers, raw_body, request)
    end

    def self.create_faraday_response(status: nil, reason_phrase: nil, headers: nil, body: nil)
      FaradayResponseMock.new(status, reason_phrase, headers, body)
    end

    def self.create_request(http_method: nil, query_url: nil, headers: {}, parameters: {}, context: {})
      HttpRequestMock.new(http_method, query_url, headers: headers, parameters: parameters, context: context)
    end

    def self.create_mock_connection
      Faraday.new do |builder|
        builder.adapter :test do |stub|
          # block returns an array with 3 items:
          # - Integer response status
          # - Hash HTTP headers
          # - String response body
          stub.get('/get') do |env|
            [
              200,
              { 'content-type': 'text/plain', },
              'Get response body.'
            ]
          end

          stub.put('/put') do |env|
            [
              200,
              { 'content-type': 'text/plain', },
              'Put response body.'
            ]
          end

          stub.get('/boom') do
            raise Faraday::ConnectionFailed
          end
        end
      end
    end
  end
end
