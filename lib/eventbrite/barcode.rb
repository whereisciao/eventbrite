require 'eventbrite/creatable'
require 'eventbrite/changeable'
require 'eventbrite/base'

module Eventbrite
  class Barcode < Eventbrite::Base
    include Eventbrite::Creatable
    include Eventbrite::Changeable

    attr_reader :status, :barcode, :checkin_type
  end
end