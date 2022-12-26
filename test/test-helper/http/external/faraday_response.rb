module TestComponent
  # Http response received.
  class FaradayResponseMock
    attr_reader :status, :reason_phrase, :headers, :raw_body, :body

    # The constructor
    # @param [Integer] status The status code returned by the server.
    # @param [String] reason_phrase The reason phrase returned by the server.
    # @param [Hash] headers The headers sent by the server in the response.
    # @param [String] body The raw body of the response.
    def initialize(status,
                   reason_phrase,
                   headers,
                   body)
      @status = status
      @reason_phrase = reason_phrase
      @headers = headers
      @body = body
    end
  end
end
