require 'addressable/uri'
require 'simple_oauth'
require 'eventbrite/version'
require 'eventbrite/loggable'

module Eventbrite
  class Client
    attr_accessor :oauth_token, :api_key, :user_key

    include Eventbrite::Loggable

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

    # @return [String]
    def user_agent
      @user_agent ||= "Eventbrite Ruby Gem #{Eventbrite::Version}"
    end

    # @return [Hash]
    def credentials
      {
        :token => oauth_token
      }
    end

    # @return [Boolean]
    def credentials?
      credentials.values.all?
    end
  end
end