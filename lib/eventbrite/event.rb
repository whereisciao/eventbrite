require 'eventbrite/creatable'
require 'eventbrite/changeable'
require 'eventbrite/identity'
require 'forwardable'

module Eventbrite
  class Event < Eventbrite::Identity
    include Eventbrite::Creatable
    include Eventbrite::Changeable

    attr_reader :capacity, :category_id, :currency, :format_id,
        :invite_only, :listed, :logo_url, :online_event,
        :organizer_id, :resource_uri, :shareable, :show_remaining,
        :status, :subcategory_id, :url, :venue_id

    object_attr_reader :HtmlString, :name
    object_attr_reader :HtmlString, :description
    object_attr_reader :Organizer, :organizer
    object_attr_reader :Venue, :venue
    object_attr_reader :Resource, :category
    object_attr_reader :Resource, :format
    object_attr_reader :TimeWithZone, :start
    object_attr_reader :TimeWithZone, :end
    object_attr_reader :TicketClasses, :ticket_classes

    extend Forwardable
    def_delegator :ticket_classes, :tickets_sold
  end
end