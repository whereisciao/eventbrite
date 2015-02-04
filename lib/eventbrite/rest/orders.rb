require 'eventbrite/rest/utils'
require 'eventbrite/order'

module Eventbrite
  module REST
    module Orders
      include Eventbrite::REST::Utils

      def order_details(order, options = {})
        perform_with_object(:get, :v3, "/v3/orders/#{extract_id(order)}/", options, Eventbrite::Order)
      end
    end
  end
end