require 'eventbrite/creatable'
require 'eventbrite/changeable'
require 'eventbrite/identity'

module Eventbrite
  class Attendee < Eventbrite::Identity
    include Eventbrite::Creatable
    include Eventbrite::Changeable

    attr_reader :email, :quantity, :status, :ticket_id

    object_attr_reader :Resource, :event
    object_attr_reader :Resource, :order
    object_attr_reader :Resource, :team
    object_attr_reader :Costs, :costs
    object_attr_reader :Profile, :profile
    object_attr_reader :Barcodes, :barcodes
    object_attr_reader :Answers, :answers
  end
end