require 'eventbrite/base'

module Eventbrite
  class TimeWithZone < Eventbrite::Base
    attr_reader :timezone, :local, :utc
  end
end