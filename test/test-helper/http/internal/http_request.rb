module TestComponent
  # An http request.
  class HttpRequestMock
    attr_accessor :http_method, :query_url, :headers,
                  :parameters, :username, :password,
                  :context

    # The constructor.
    # @param [HttpMethodEnum] http_method The HTTP method.
    # @param [String] query_url The URL to send the request to.
    # @param [Hash, Optional] headers The headers for the HTTP Request.
    # @param [Hash, Optional] parameters The parameters for the HTTP Request.
    # @param [Hash, Optional] context The context for the HTTP Request.
    def initialize(http_method,
                   query_url,
                   headers: {},
                   parameters: {},
                   context: {})
      @http_method = http_method
      @query_url = query_url
      @headers = headers
      @parameters = parameters
      @context = context
    end
  end
end
