require 'eventbrite/rest/utils'
require 'eventbrite/user'

module Eventbrite
  module REST
    module Users
      include Eventbrite::REST::Utils

      def user_details(*args)
        user, options = parse_args(args)
        perform_with_object(:get, :v3, "/v3/users/#{extract_user_id(user)}/", options, Eventbrite::User)
      end

      def user_orders(*args)
        user, options = parse_args(args)
        perform_with_cursor(:get, :v3, "/v3/users/#{extract_user_id(user)}/orders/", options, :orders, Eventbrite::Order)
      end

      def user_owned_events(*args)
        user, options = parse_args(args)

        begin
          perform_with_cursor(:get, :v3, "/v3/users/#{extract_user_id(user)}/owned_events/", options, :events, Eventbrite::Event)
        rescue Eventbrite::Error::BadRequest => e
          if options[:page] == 1
            return []
          else
            raise e
          end
        end
      end

      def user_owned_event_orders(*args)
        user, options = parse_args(args)
        perform_with_cursor(:get, :v3, "/v3/users/#{extract_user_id(user)}/owned_event_orders/", options, :orders, Eventbrite::Order)
      end

      def user_owned_attendees(*args)
        user, options = parse_args(args)
        perform_with_cursor(:get, :v3, "/v3/users/#{extract_user_id(user)}/owned_event_attendees/", options, :attendees, Eventbrite::Attendee)
      end

      def user_venues(*args)
        user, options = parse_args(args)
        perform_with_cursor(:get, :v3, "/v3/users/#{extract_user_id(user)}/venues/", options, :venues, Eventbrite::Venue)
      end

      def user_organizers(*args)
        user, options = parse_args(args)
        perform_with_cursor(:get, :v3, "/v3/users/#{extract_user_id(user)}/organizers/", options, :organizers, Eventbrite::Organizer)
      end
    end
  end
end