require 'eventbrite/rest/utils'
require 'eventbrite/event'
require 'eventbrite/order'

module Eventbrite
  module REST
    module Events
      include Eventbrite::REST::Utils

      def event_details(event, options = {})
        perform_with_object(:get, "/v3/events/#{extract_id(event)}/", options, Eventbrite::Event)
      end

      def event_orders(event, options = {})
        perform_with_cursor(:get, "/v3/events/#{extract_id(event)}/orders/", options, :orders, Eventbrite::Order)
      end
    end
  end
end