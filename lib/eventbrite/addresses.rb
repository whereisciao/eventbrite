require 'eventbrite/base'

module Eventbrite
  class Addresses < Eventbrite::Base
    object_attr_reader :Address, :home
    object_attr_reader :Address, :ship
    object_attr_reader :Address, :work
  end
end