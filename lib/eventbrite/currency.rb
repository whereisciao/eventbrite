require 'eventbrite/base'

module Eventbrite
  class Currency < Eventbrite::Base
    attr_reader :currency, :display, :value

  end
end