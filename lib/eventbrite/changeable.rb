require 'time'
require 'memoizable'

module Eventbrite
  module Changeable
    include Memoizable

    # Time when the object was updated on Eventbrite
    #
    # @return [Time]
    def changed
      Time.parse(@attrs[:changed]) unless @attrs[:changed].nil?
    end
    memoize :changed

    # @return [Boolean]
    def changed?
      !!@attrs[:changed]
    end
    memoize :changed?
  end
end
