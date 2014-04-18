require 'eventbrite/identity'

module Eventbrite
  class User < Eventbrite::Identity
    include Eventbrite::Creatable
    include Eventbrite::Changeable

    attr_reader :name, :first_name, :last_name
    object_attr_reader :Emails, :emails
  end
end