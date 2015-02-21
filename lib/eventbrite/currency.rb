require 'eventbrite/base'
require 'money'

module Eventbrite
  class Currency < Eventbrite::Base
    attr_reader :currency, :display, :value

    def to_money
      Money.new(value, currency)
    end
  end
end