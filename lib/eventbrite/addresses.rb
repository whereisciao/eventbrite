require 'eventbrite/base'

module Eventbrite
  class Addresses < Eventbrite::Base
    address_reader :home
    address_reader :ship
    address_reader :work
  end
end