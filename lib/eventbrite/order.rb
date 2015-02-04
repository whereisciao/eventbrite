require 'eventbrite/creatable'
require 'eventbrite/changeable'
require 'eventbrite/identity'

module Eventbrite
  class Order < Eventbrite::Identity
    include Eventbrite::Creatable
    include Eventbrite::Changeable

    attr_reader :email, :event_id, :first_name, :last_name,
      :name, :resource_uri, :status

    object_attr_reader :Event,  :event
    object_attr_reader :Attendees, :attendees
    object_attr_reader :Costs, :costs
  end
end