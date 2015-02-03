require 'eventbrite/base'

module Eventbrite
  class Address < Eventbrite::Base
    attr_reader :address_1, :address_2, :city, :country, :country_name,
      :latitude, :longitude, :postal_code, :region
  end
end