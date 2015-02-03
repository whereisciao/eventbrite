require 'eventbrite/creatable'
require 'eventbrite/changeable'
require 'eventbrite/identity'

module Eventbrite
  class Attendee < Eventbrite::Identity
    include Eventbrite::Creatable
    include Eventbrite::Changeable

    attr_reader :affiliate, :cancelled, :checked_in, :event_id,
        :order_id, :quantity, :refunded, :resource_uri, :status,
        :ticket_class_id

    # object_attr_reader :Resource, :event
    # object_attr_reader :Resource, :order
    # object_attr_reader :Resource, :team
    # object_attr_reader :Costs, :costs
    object_attr_reader :Profile, :profile
    # object_attr_reader :Barcodes, :barcodes
    # object_attr_reader :Answers, :answers
  end
end