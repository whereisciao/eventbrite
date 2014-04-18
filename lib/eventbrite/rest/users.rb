require 'eventbrite/rest/utils'
require 'eventbrite/user'

module Eventbrite
  module REST
    module Users
      include Eventbrite::REST::Utils

      def user_details(user = nil, options = {})
        perform_with_object(:get, "/v3/users/#{extract_user_id(user)}/", options, Eventbrite::User)
      end
    end
  end
end