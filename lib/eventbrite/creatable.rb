require 'time'
require 'memoizable'

module Eventbrite
  module Creatable
    include Memoizable

    # Time when the object was created on Eventbrite
    #
    # @return [Time]
    def created
      Time.parse(@attrs[:created]) unless @attrs[:created].nil?
    end
    memoize :created

    # @return [Boolean]
    def created?
      !!@attrs[:created]
    end
    memoize :created?
  end
end
