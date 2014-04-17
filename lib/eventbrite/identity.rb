require 'equalizer'
require 'eventbrite/base'

module Eventbrite
  class Identity < Eventbrite::Base
    include Equalizer.new(:id)
    attr_reader :id

    # Initializes a new object
    #
    # @param attrs [Hash]
    # @raise [ArgumentError] Error raised when supplied argument is missing an :id key.
    # @return [Twitter::Identity]
    def initialize(attrs = {})
      attrs.fetch(:id)
      super
    end
  end
end