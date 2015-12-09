require 'eventbrite/rest/utils'
require 'eventbrite/ticket_class'

module Eventbrite
  module REST
    module TicketClasses
      include Eventbrite::REST::Utils

      def event_ticket_classes(event, options = {})
        perform_with_cursor(:get, :v3, "/v3/events/#{extract_id(event)}/ticket_classes/", options, :ticket_classes, Eventbrite::TicketClass)
      end

    end
  end
end