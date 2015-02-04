require 'eventbrite/rest/events'
require 'eventbrite/rest/users'
require 'eventbrite/rest/orders'

module Eventbrite
  module REST
    module API
      ENDPOINT = 'https://www.eventbriteapi.com'

      include Eventbrite::REST::Events
      include Eventbrite::REST::Users
      include Eventbrite::REST::Orders

    private
      def connection_v3
        @connection_v3 ||= Faraday.new(ENDPOINT, connection_options)
      end
    end
  end
end
