module Eventbrite
  class Error < StandardError
    attr_reader :message, :description, :code

    class << self
      def from_response(response)
        message, description, code = parse_error(response.body)
        new(message, description, code)
      end

      def errors
        @errors ||= {
          401 => Eventbrite::Error::Unauthorized
        }

      end

    private
      def parse_error(body)
        if body.nil?
          ['', '', nil]
        else
          [
            body[:error],
            body[:error_description],
            body[:error]
          ]
        end
      end

    end

    def initialize(message = '', description = '', code = nil)
      super(description)

      @message = message
      @description = description
      @code = code
    end

    # Raised when Eventbrite returns a 4xx HTTP status code
    class ClientError < self; end

    # Raised when Twitter returns the HTTP status code 401
    class Unauthorized < ClientError; end

  end
end
