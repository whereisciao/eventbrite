require 'eventbrite/rest/utils'
require 'eventbrite/user'

module Eventbrite
  module REST
    module Users
      include Eventbrite::REST::Utils

      def user_details(user = nil, options = {})
        perform_with_object(:get, "/v3/users/#{extract_user_id(user)}/", options, Eventbrite::User)
      end

      def user_orders(user = nil, options = {})
        perform_with_cursor(:get, "/v3/users/#{extract_user_id(user)}/orders/", options, :orders, Eventbrite::Order)
      end
    end
  end
end