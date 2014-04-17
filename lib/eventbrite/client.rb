require 'addressable/uri'
require 'simple_oauth'
require 'eventbrite/version'

module Eventbrite
  class Client
    attr_accessor :oauth_token, :api_key, :user_key

    # Initializes a new Client object
    #
    # @param options [Hash]
    # @return [Twitter::Client]
    def initialize(options = {})
      options.each do |key, value|
        send(:"#{key}=", value)
      end
      yield(self) if block_given?
    end
  end
end