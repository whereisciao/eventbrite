require 'faraday'
require 'eventbrite/loggable'

module Eventbrite
  module REST
    module Response
      class Middleware < Faraday::Response::Middleware
        include Eventbrite::Loggable
      end
    end
  end
end
