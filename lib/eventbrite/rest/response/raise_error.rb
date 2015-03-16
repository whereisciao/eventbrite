require_relative 'middleware'
require 'eventbrite/error'

module Eventbrite
  module REST
    module Response
      class RaiseError < Eventbrite::REST::Response::Middleware
        def on_complete(response)
          logger.debug("Raise Error: #{response.status} : #{response.body}")

          status_code = response.status
          klass = Eventbrite::Error.errors[status_code]
          if klass
            error = klass.from_response(response)
            fail(error)
          end
        end
      end
    end
  end
end


Faraday::Response.register_middleware raise_error: Eventbrite::REST::Response::RaiseError