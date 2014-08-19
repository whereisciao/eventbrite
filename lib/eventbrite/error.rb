module Eventbrite
  class Error < StandardError
    attr_reader :type, :message

    def self.from_response(response)
      error_type, error_message = parse_error(response.body)
      new(error_type, error_message)
    end

    def self.parse_error(body)
      error = body[:error]

      if body.nil?
        ['', nil]
      elsif body[:error]
        [body[:error_type], body[:error_message]]
      end
    end

    def initialize(type, message)
      @type = type
      @message = message
    end
  end
end
