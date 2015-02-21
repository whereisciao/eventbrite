require 'eventbrite/base'

module Eventbrite
  class Address < Eventbrite::Base

    FIELDS = [:address_1, :address_2, :city, :country, :country_name,
      :latitude, :longitude, :postal_code, :region]

    attr_reader *FIELDS
  end
end