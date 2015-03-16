require 'eventbrite/loggable'

module Eventbrite
  class Error < StandardError
    attr_reader :message, :description, :code

    include Eventbrite::Loggable

    class << self
      def from_response(response)
        message, description, code = parse_error(response.body)
        new(message, description, code)
      end

      def errors
        @errors ||= {
          400 => Eventbrite::Error::BadRequest,
          401 => Eventbrite::Error::Unauthorized,
          403 => Eventbrite::Error::Forbidden,
          404 => Eventbrite::Error::NotFound,
          500 => Eventbrite::Error::InternalServerError
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

      logger.debug "Initializing Error: #{code} #{message} : #{description}"

      @message = message
      @description = description
      @code = code
    end

    # Raised when Eventbrite returns a 4xx HTTP status code
    class ClientError < self; end

    # Raised when Eventbrite returns the HTTP status code 400
    class BadRequest < ClientError; end

    # Raised when Eventbrite returns the HTTP status code 401
    class Unauthorized < ClientError; end

    # Raised when Eventbrite returns the HTTP status code 403
    class Forbidden < ClientError; end

    # Raised when Eventbrite returns the HTTP status code 404
    class NotFound < ClientError; end

    # Raised when Eventbrite returns a 5xx HTTP status code
    class ServerError < self; end

    # Raised when Eventbrite returns the HTTP status code 500
    class InternalServerError < ServerError; end
  end
end
