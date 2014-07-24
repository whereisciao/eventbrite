require 'eventbrite/rest/utils'
require 'eventbrite/user'

module Eventbrite
  module REST
    module Users
      include Eventbrite::REST::Utils

      def user_details(user = nil, options = {})
        perform_with_object(:get, :v3, "/v3/users/#{extract_user_id(user)}/", options, Eventbrite::User)
      end

      def user_orders(user = nil, options = {})
        perform_with_cursor(:get, :v3, "/v3/users/#{extract_user_id(user)}/orders/", options, :orders, Eventbrite::Order)
      end

      def user_owned_events(user = nil, options = {})
        perform_with_cursor(:get, :v3, "/v3/users/#{extract_user_id(user)}/owned_events/", options, :events, Eventbrite::Event)
      end

      def user_owned_event_orders(user = nil, options = {})
        perform_with_cursor(:get, :v3, "/v3/users/#{extract_user_id(user)}/owned_event_orders/", options, :orders, Eventbrite::Order)
      end

      def user_owned_attendees(user = nil, options = {})
        perform_with_cursor(:get, :v3, "/v3/users/#{extract_user_id(user)}/owned_event_attendees/", options, :attendees, Eventbrite::Attendee)
      end

      def user_venues(user = nil, options = {})
        perform_with_cursor(:get, :v3, "/v3/users/#{extract_user_id(user)}/venues/", options, :venues, Eventbrite::Venue)
      end

      def user_organizers(user = nil, options = {})
        perform_with_cursor(:get, :v3, "/v3/users/#{extract_user_id(user)}/organizers/", options, :organizers, Eventbrite::Organizer)
      end
    end
  end
end