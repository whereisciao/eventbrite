require 'faraday'
require 'eventbrite/error'

module Eventbrite
  module REST
    module Response
      class RaiseError < Faraday::Response::Middleware
        def on_complete(response)
          if response[:body] && response[:body][:error]
            error = Eventbrite::Error.from_response(response)
            fail(error)
          end
        end
      end
    end
  end
end


Faraday::Response.register_middleware raise_error: Eventbrite::REST::Response::RaiseError