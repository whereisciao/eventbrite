require 'eventbrite/creatable'
require 'eventbrite/changeable'
require 'eventbrite/identity'

module Eventbrite
  class Event < Eventbrite::Identity
    include Eventbrite::Creatable
    include Eventbrite::Changeable

    attr_reader :resource_uri, :url, :logo_url, :capacity, :status
    object_attr_reader :HtmlString, :name
    object_attr_reader :HtmlString, :description
    object_attr_reader :Organizer, :organizer
    object_attr_reader :Venue, :venue
    object_attr_reader :Resource, :category
    object_attr_reader :Resource, :format
    object_attr_reader :TimeWithZone, :start
    object_attr_reader :TimeWithZone, :end
    object_attr_reader :TicketClasses, :ticket_classes

  end
end