require 'eventbrite/enumerable'

module Eventbrite
  class Cursor
    include Eventbrite::Enumerable
    attr_reader :attrs
    alias_method :to_h, :attrs

    # Initializes a new Cursor
    #
    # @param attrs [Hash]
    # @param key [String, Symbol] The key to fetch the data from the response
    # @param klass [Class] The class to instantiate objects in the response
    # @param request [Eventbrite::Request]
    # @return [Eventbrite::Cursor]
    def initialize(attrs, key, klass, request)
      @key = key.to_sym
      @klass = klass
      @client = request.client
      @request_method = request.verb
      @path = request.path
      @options = request.options
      @collection = []
      self.attrs = attrs
    end

  private

    # @return [Integer]
    def next_page
      @attrs[:next_page] || -1
    end
    alias_method :next, :next_page

    # @return [Boolean]
    def last?
      next_page.zero?
    end

    # @return [Hash]
    def fetch_next_page
      response = @client.send(@request_method, @path, @options.merge(:page => next_page)).body
      self.attrs = response
    end

    # @param attrs [Hash]
    # @return [Hash]
    def attrs=(attrs)
      @attrs = attrs
      Array(attrs[@key]).each do |element|
        @collection << (@klass ? @klass.new(element) : element)
      end
      @attrs
    end
  end
end
