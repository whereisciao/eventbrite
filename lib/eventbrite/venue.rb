require 'eventbrite/identity'

module Eventbrite
  class Venue < Eventbrite::Identity
    attr_reader :name, :latitude, :longitude
    object_attr_reader :Address, :address
  end
end