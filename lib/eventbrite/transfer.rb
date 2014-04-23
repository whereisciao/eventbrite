require 'eventbrite/creatable'
require 'eventbrite/changeable'
require 'eventbrite/identity'
require 'eventbrite/base'

module Eventbrite
  class Transfer < Eventbrite::Identity
    class OrderReference < Eventbrite::Base
      attr_reader :event_id, :order_id, :attendee_id, :gross
    end

    class TransferFees < Eventbrite::Base
      attr_reader :cost_increase, :gross, :payment_fee,
        :eventbrite_fee, :transfer_fee, :tax, :currency
    end

    class TransferDates < Eventbrite::Base
      include Eventbrite::Creatable
      include Eventbrite::Changeable
    end

    object_attr_reader :OrderReference, :source
    object_attr_reader :OrderReference, :destination
    object_attr_reader :TransferFees, :fees
    object_attr_reader :TransferDates, :dates
  end
end