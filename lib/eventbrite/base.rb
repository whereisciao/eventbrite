require 'addressable/uri'
require 'forwardable'
require 'memoizable'
require 'eventbrite/null_object'

module Eventbrite
  class Base
    extend Forwardable
    include Memoizable

    RUBY_RESERVED_WORDS = []

    attr_reader :attrs
    alias_method :to_h, :attrs
    class << self
      # Define methods that retrieve the value from attributes
      #
      # @param attrs [Array, Symbol]
      def attr_reader(*attrs)
        attrs.each do |attr|
          define_attribute_method(attr)
          define_predicate_method(attr)
        end
      end

      # Define object methods from attributes
      #
      # @param klass [Symbol]
      # @param key1 [Symbol]
      # @param key2 [Symbol]
      def object_attr_reader(klass, key1, key2 = nil)
        define_attribute_method(key1, klass, key2)
        define_predicate_method(key1)
      end

      # Define URI methods from attributes
      #
      # @param attrs [Array, Symbol]
      def uri_attr_reader(*attrs)
        attrs.each do |uri_key|
          array = uri_key.to_s.split('_')
          index = array.index('uri')
          array[index] = 'url'
          url_key = array.join('_').to_sym
          define_uri_method(uri_key, url_key)
          alias_method(url_key, uri_key)
          define_predicate_method(uri_key, url_key)
          alias_method(:"#{url_key}?", :"#{uri_key}?")
        end
      end

      # Define display_uri attribute methods
      def display_uri_attr_reader
        define_attribute_method(:display_url)
        alias_method(:display_uri, :display_url)
        define_predicate_method(:display_uri, :display_url)
        alias_method(:display_url?, :display_uri?)
      end

      # Dynamically define a method for a URI
      #
      # @param key1 [Symbol]
      # @param key2 [Symbol]
      def define_uri_method(key1, key2)
        define_method(key1) do ||
          Addressable::URI.parse(@attrs[key2]) unless @attrs[key2].nil?
        end
        memoize(key1)
      end

      # Dynamically define a method for an attribute
      #
      # @param key1 [Symbol]
      # @param klass [Symbol]
      # @param key2 [Symbol]
      def define_attribute_method(key1, klass = nil, key2 = nil)
        define_method(key1) do ||
          if klass.nil?
            @attrs[key1]
          else
            if @attrs[key1].nil?
              NullObject.new
            else
              attrs = attrs_for_object(key1, key2)
              Eventbrite.const_get(klass).new(attrs)
            end
          end
        end
        memoize(key1)
      end

      # Dynamically define a method for an attribute
      #
      # @param key [Symbol]
      def deprecate_attribute_method(key)
        define_method(key) do ||
          warn "#{Kernel.caller.first}: [DEPRECATION] ##{key} is deprecated. Use ##{key}? instead."
          @attrs[key]
        end
        memoize(key)
      end

      # Dynamically define a predicate method for an attribute
      #
      # @param key1 [Symbol]
      # @param key2 [Symbol]
      def define_predicate_method(key1, key2 = key1)
        define_method(:"#{key1}?") do ||
          !@attrs[key2].nil? && @attrs[key2] != false
        end
        memoize(:"#{key1}?")
      end

      # File activesupport/lib/active_support/core_ext/module/delegation.rb, line 151
      def delegate(*methods)
        options = methods.pop
        unless options.is_a?(Hash) && to = options[:to]
          raise ArgumentError, 'Delegation needs a target. Supply an options hash with a :to key as the last argument (e.g. delegate :hello, to: :greeter).'
        end

        prefix, allow_nil = options.values_at(:prefix, :allow_nil)

        if prefix == true && to =~ /^[^a-z_]/
          raise ArgumentError, 'Can only automatically set the delegation prefix when delegating to a method.'
        end

        method_prefix =        if prefix
            "#{prefix == true ? to : prefix}_"
          else
            ''
          end

        file, line = caller.first.split(':', 2)
        line = line.to_i

        to = to.to_s
        to = "self.#{to}" if RUBY_RESERVED_WORDS.include?(to)

        methods.each do |method|
          # Attribute writer methods only accept one argument. Makes sure []=
          # methods still accept two arguments.
          definition = (method =~ /[^\]]=$/) ? 'arg' : '*args, &block'

          # The following generated method calls the target exactly once, storing
          # the returned value in a dummy variable.
          #
          # Reason is twofold: On one hand doing less calls is in general better.
          # On the other hand it could be that the target has side-effects,
          # whereas conceptually, from the user point of view, the delegator should
          # be doing one call.

          exception = %Q(raise DelegationError, "#{self}##{method_prefix}#{method} delegated to #{to}.#{method}, but #{to} is nil: \#{self.inspect}")

          method_def = [
            "def #{method_prefix}#{method}(#{definition})",
            "  _ = #{to}",
            "  if !_.nil? || nil.respond_to?(:#{method})",
            "    _.#{method}(#{definition})",
            "  else",
            "    #{exception unless allow_nil}",
            "  end",
            "end"
          ].join ';'

          module_eval(method_def, file, line)
        end
      end

      # Dynamically define method and accessors for Address Object
      def address_reader(field)
        object_attr_reader :Address, field

        delegate *Address::FIELDS, to: field,
          allow_nil: true, prefix: true
      end

      # Dynamically define method and accessors for Addresses Object
      def addresses_reader(field)
        object_attr_reader :Addresses, field
        delegate_address_fields to: field
      end

      def delegate_address_fields(params = {})
        Addresses::TYPES.each do |address_type|
          delegate *address_fields(prefix: address_type),
            to: params[:to], allow_nil: true
        end
      end

      def address_fields(params = {})
        fields = Eventbrite::Address::FIELDS

        if params[:prefix]
          fields = fields.map do |field|
            "#{params[:prefix]}_#{field}".to_sym
          end
        end

        fields
      end
    end

    # Initializes a new object
    #
    # @param attrs [Hash]
    # @return [Twitter::Base]
    def initialize(attrs = {})
      @attrs = attrs || {}
    end

    # Fetches an attribute of an object using hash notation
    #
    # @param method [String, Symbol] Message to send to the object
    def [](method)
      warn "#{Kernel.caller.first}: [DEPRECATION] #[#{method.inspect}] is deprecated. Use ##{method} to fetch the value."
      send(method.to_sym)
    rescue NoMethodError
      nil
    end

  private

    def attrs_for_object(key1, key2 = nil)
      if key2.nil?
        @attrs[key1]
      else
        attrs = @attrs.dup
        attrs.delete(key1).merge(key2 => attrs)
      end
    end
  end
end
