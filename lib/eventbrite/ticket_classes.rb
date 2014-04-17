require 'memoizable'
require 'eventbrite/enumerable'

module Eventbrite
  class TicketClasses
    include Eventbrite::Enumerable
    include Memoizable

    def initialize(collection)
      @collection = Array(collection).collect do |ticket_class|
        TicketClass.new(ticket_class)
      end
    end
  end
end