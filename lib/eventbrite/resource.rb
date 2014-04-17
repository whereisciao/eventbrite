require 'eventbrite/identity'

module Eventbrite
  class Resource < Eventbrite::Identity
    attr_reader :resource_uri, :name, :short_name
  end
end