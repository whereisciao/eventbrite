module Eventbrite
  class Costs < Eventbrite::Base
    object_attr_reader :Cost, :payment_fee
    object_attr_reader :Cost, :gross
    object_attr_reader :Cost, :eventbrite_fee
    object_attr_reader :Cost, :tax
  end
end