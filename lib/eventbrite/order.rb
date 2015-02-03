require 'eventbrite/creatable'
require 'eventbrite/changeable'
require 'eventbrite/identity'

module Eventbrite
  class Order < Eventbrite::Identity
    include Eventbrite::Creatable
    include Eventbrite::Changeable

    attr_reader :resource_uri, :first_name, :last_name, :email,
      :name, :status

    object_attr_reader :Resource,  :event
    object_attr_reader :Attendees, :attendees
    object_attr_reader :Costs, :costs
  end
end