require 'eventbrite/base'

module Eventbrite
  class Cost < Eventbrite::Base
    attr_reader :currency, :display, :value
  end
end