require 'eventbrite/creatable'
require 'eventbrite/changeable'
require 'eventbrite/identity'

module Eventbrite
  class Order < Eventbrite::Identity
    include Eventbrite::Creatable
    include Eventbrite::Changeable

    attr_reader :resource_uri, :first_name, :last_name, :email, :status
    object_attr_reader :Resource, :event
  end
end