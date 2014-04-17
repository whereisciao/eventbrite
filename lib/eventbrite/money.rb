require 'eventbrite/base'

module Eventbrite
  class Money < Eventbrite::Base
    attr_reader :currency, :display, :value
  end
end