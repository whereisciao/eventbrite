require 'eventbrite/rest/utils'
require 'eventbrite/event'
require 'eventbrite/order'
require 'eventbrite/attendee'

module Eventbrite
  module REST
    module Events
      include Eventbrite::REST::Utils

      def event_search(options = {})
        perform_with_cursor(:get, :v3, "/v3/events/search/", options, :events, Eventbrite::Event)
      end

      def event_categories(options = {})
        perform_with_objects(:get, :v3, "/v3/categories/", options, :categories, Eventbrite::Resource)
      end

      def event_details(event, options = {})
        perform_with_object(:get, :v3, "/v3/events/#{extract_id(event)}/", options, Eventbrite::Event)
      end

      def update_event_details(event, options = {})
        perform_with_object(:post, :v3, "/v3/events/#{extract_id(event)}/", options, Eventbrite::Event)
      end

      def event_attendees(event, options = {})
        perform_with_cursor(:get, :v3, "/v3/events/#{extract_id(event)}/attendees/", options, :attendees, Eventbrite::Attendee)
      end

      def event_attendees_detail(event, attendee, options = {})
        perform_with_object(:get, :v3, "/v3/events/#{extract_id(event)}/attendees/#{extract_id(attendee)}/", options, Eventbrite::Attendee)
      end

      def event_orders(event, options = {})
        perform_with_cursor(:get, :v3, "/v3/events/#{extract_id(event)}/orders/", options, :orders, Eventbrite::Order)
      end

      def event_discounts(event, options = {})
        perform_with_cursor(:get, :v3, "/v3/events/#{extract_id(event)}/discounts/", options, :discounts, Eventbrite::Discount)
      end

      def event_access_codes(event, options = {})
        perform_with_cursor(:get, :v3, "/v3/events/#{extract_id(event)}/access_codes/", options, :access_codes, Eventbrite::AccessCode)
      end

      def event_transfers(event, options = {})
        perform_with_cursor(:get, :v3, "/v3/events/#{extract_id(event)}/transfers/", options, :transfers, Eventbrite::Transfer)
      end
    end
  end
end