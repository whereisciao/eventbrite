require 'memoizable'
require 'eventbrite/enumerable'

module Eventbrite
  class Barcodes
    include Eventbrite::Enumerable
    include Memoizable

    def initialize(collection)
      @collection = Array(collection).collect do |object|
        Barcode.new(object)
      end
    end
  end
end