require 'eventbrite/rest/utils'
require 'eventbrite/event'

module Eventbrite
  module REST
    module Events
      include Eventbrite::REST::Utils

      def event_details(event, options = {})
        perform_with_object(:get, "/v3/events/#{extract_id(event)}/", options, Eventbrite::Event)
      end
    end
  end
end