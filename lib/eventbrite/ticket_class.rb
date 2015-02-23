require 'eventbrite/identity'

module Eventbrite
  class TicketClass < Eventbrite::Identity
    attr_reader :resource_uri, :name, :description,
      :donation, :free, :minimum_quantity,
      :maximum_quantity, :quantity_total,
      :quantity_sold, :hidden, :include_fee,
      :split_fee, :hide_description, :auto_hide,
      :variants, :event_id

    object_attr_reader :Currency, :cost
    object_attr_reader :Currency, :fee
    object_attr_reader :Currency, :actual_cost
    object_attr_reader :Currency, :actual_fee

    def sales_start
      Time.parse(@attrs[:sales_start]) unless @attrs[:sales_start].nil?
    end
    memoize :sales_start

    def sales_end
      Time.parse(@attrs[:sales_end]) unless @attrs[:sales_end].nil?
    end
    memoize :sales_end

    def visible
      !hidden
    end

    def quantity_available
      @quantity_available ||= quantity_total - quantity_sold
    end
  end
end