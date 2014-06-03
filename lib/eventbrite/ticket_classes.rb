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

    def tickets_sold
      unless @collection.empty?
        @collection.map(&:quantity_sold).inject(:+)
      end
    end
    memoize :tickets_sold
  end
end