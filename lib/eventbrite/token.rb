require 'eventbrite/base'

module Eventbrite
  class Token < Eventbrite::Base
    attr_reader :access_token, :token_type
    alias_method :to_s, :access_token

    BEARER_TYPE = 'bearer'

    # @return [Boolean]
    def bearer?
      @attrs[:token_type] == BEARER_TYPE
    end
    memoize :bearer?
  end
end
