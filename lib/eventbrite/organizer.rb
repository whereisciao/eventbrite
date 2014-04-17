require 'eventbrite/identity'

module Eventbrite
  class Organizer < Eventbrite::Identity
    attr_reader :name, :url
    object_attr_reader :HtmlString, :description
  end
end