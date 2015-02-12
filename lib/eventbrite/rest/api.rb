require 'eventbrite/rest/events'
require 'eventbrite/rest/orders'
require 'eventbrite/rest/user_organizers'
require 'eventbrite/rest/users'

module Eventbrite
  module REST
    module API
      ENDPOINT = 'https://www.eventbriteapi.com'

      include Eventbrite::REST::Events
      include Eventbrite::REST::Orders
      include Eventbrite::REST::UserOrganizers
      include Eventbrite::REST::Users

    private
      def connection_v3
        @connection_v3 ||= Faraday.new(ENDPOINT, connection_options)
      end
    end
  end
end
