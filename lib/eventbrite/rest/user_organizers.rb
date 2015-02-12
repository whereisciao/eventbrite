require 'eventbrite/rest/utils'
require 'eventbrite/organizer'

module Eventbrite
  module REST
    module UserOrganizers
      include Eventbrite::REST::Utils

      def create_user_organizer(organizer = nil, options = {})
        perform_with_object(:post, :v3, "/v3/organizers/", options, Eventbrite::Organizer)
      end

      def update_user_organizer(organizer = nil, options = {})
        perform_with_object(:post, :v3, "/v3/organizers/#{extract_user_id(organizer)}/", options, Eventbrite::Organizer)
      end

      def list_user_organizers(user = nil, options = {})
        perform_with_cursor(:get, :v3, "/v3/users/#{extract_user_id(user)}/organizers/", options, :organizers, Eventbrite::Organizer)
      end
    end
  end
end