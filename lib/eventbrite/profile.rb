require 'eventbrite/base'

module Eventbrite
  class Profile < Eventbrite::Base
    attr_reader :gender, :first_name, :last_name, :age, :email, :name

    object_attr_reader :Addresses, :addresses
  end
end