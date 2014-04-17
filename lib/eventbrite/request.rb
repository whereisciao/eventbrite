module Eventbrite
  class Request
    attr_accessor :client, :request_method, :path, :options
    alias_method :verb, :request_method

    def initialize(client, request_method, path, options = {})
      @client = client
      @request_method = request_method.to_sym
      @path = path
      @options = options
    end

    # @return [Hash]
    def perform
      @client.send(@request_method, @path, @options).body
    end

    # @param klass [Class]
    # @param request [Twitter::Request]
    # @return [Object]
    def perform_with_object(klass)
      klass.new(perform)
    end
  end
end