require 'eventbrite/identity'

module Eventbrite
  class TicketClass < Eventbrite::Identity
    attr_reader :name, :free, :minimum_quantity,
      :maximum_quantity, :quantity_total, :quantity_sold
    object_attr_reader :Money, :cost
    object_attr_reader :Money, :fee

    def sales_start
      Time.parse(@attrs[:sales_start]) unless @attrs[:sales_start].nil?
    end
    memoize :sales_start

    def sales_end
      Time.parse(@attrs[:sales_end]) unless @attrs[:sales_end].nil?
    end
    memoize :sales_end
  end
end