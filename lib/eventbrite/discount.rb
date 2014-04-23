require 'eventbrite/identity'

module Eventbrite
  class Discount < Eventbrite::Identity
    attr_reader :code, :amount_off, :percent_off, :ticket_ids,
      :quantity_available, :resource_uri
    object_attr_reader :Resource, :event

    def start_date
      Time.parse(@attrs[:start_date]) unless @attrs[:start_date].nil?
    end
    memoize :start_date

    def end_date
      Time.parse(@attrs[:end_date]) unless @attrs[:end_date].nil?
    end
  end
end