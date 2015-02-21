require 'eventbrite/identity'

module Eventbrite
  class Venue < Eventbrite::Identity
    attr_reader :name, :latitude, :longitude

    address_reader :address
  end
end