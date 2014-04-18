require 'memoizable'
require 'eventbrite/enumerable'

module Eventbrite
  class Attendees
    include Eventbrite::Enumerable
    include Memoizable

    def initialize(collection)
      @collection = Array(collection).collect do |object|
        Attendee.new(object)
      end
    end
  end
end