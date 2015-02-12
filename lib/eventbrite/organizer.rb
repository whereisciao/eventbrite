require 'eventbrite/identity'

module Eventbrite
  class Organizer < Eventbrite::Identity
    attr_reader :name, :url, :resource_uri, :num_past_event, :num_future_events
    object_attr_reader :HtmlString, :description

    def_delegator :description, :html, :description_html
  end
end