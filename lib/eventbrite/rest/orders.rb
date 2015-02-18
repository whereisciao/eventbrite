require 'eventbrite/rest/utils'
require 'eventbrite/order'

module Eventbrite
  module REST
    module Orders
      include Eventbrite::REST::Utils

      def event_orders(event, options = {})
        perform_with_cursor(:get, :v3, "/v3/events/#{extract_id(event)}/orders/", options, :orders, Eventbrite::Order)
      end

      def order_details(order, options = {})
        perform_with_object(:get, :v3, "/v3/orders/#{extract_id(order)}/", options, Eventbrite::Order)
      end
    end
  end
end