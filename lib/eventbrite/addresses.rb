require 'eventbrite/base'

module Eventbrite
  class Addresses < Eventbrite::Base
    TYPES = [:home, :ship, :work]

    TYPES.each do |address_type|
      address_reader address_type
    end
  end
end