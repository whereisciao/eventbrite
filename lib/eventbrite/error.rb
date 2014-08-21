module Eventbrite
  class Error < StandardError
    attr_reader :type, :message

    def self.from_response(response)
      error_type, error_message = parse_error(response.body)
      new(error_type, error_message)
    end

    def self.parse_error(body)
      error = body[:error]

      if error.nil?
        ['', nil]
      else
        [error[:error_type], error[:error_message]]
      end
    end

    def initialize(type, message)
      @type = type
      @message = message
    end
  end
end
