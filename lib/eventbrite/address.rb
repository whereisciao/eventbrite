require 'eventbrite/identity'

module Eventbrite
  class Address < Eventbrite::Base
    attr_reader :country_name, :city, :address_1, :address_2, :country, :region
  end
end