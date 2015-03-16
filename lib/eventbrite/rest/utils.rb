require 'eventbrite/request'
require 'eventbrite/loggable'

module Eventbrite
  module REST
    module Utils
      URI_SUBSTRING = '://'
      DEFAULT_CURSOR = 1

      extend Eventbrite::Loggable

      def extract_id(object)
        case object
        when ::Integer
          object
        when ::String
          object
        when Eventbrite::Identity
          object.id
        end
      end

      def extract_user_id(user)
        user.nil? ? 'me' : extract_id(user)
      end

      def parse_args(arguments)
        object, options = arguments

        if object.kind_of?(Hash)
          options = object
          object = nil
        end

        [object, options || {}]
      end

      # @param request_method [Symbol]
      # @param version [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @param klass [Class]
      def perform_with_object (request_method, version, path, options, klass)
        request = Eventbrite::Request.new(self, request_method, version, path, options)
        request.perform_with_object(klass)
      end

      # @param request_method [Symbol]
      # @param version [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @param klass [Class]
      def perform_with_objects (request_method, version, path, options, collection_name, klass)
        request = Eventbrite::Request.new(self, request_method, version, path, options)
        request.perform_with_objects(collection_name.to_sym, klass)
      end

      # @param request_method [Symbol]
      # @param version [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @param klass [Class]
      def perform_with_cursor (request_method, version, path, options, collection_name, klass = nil) # rubocop:disable ParameterLists
        merge_default_cursor!(options)
        request = Eventbrite::Request.new(self, request_method, version, path, options)
        request.perform_with_cursor(collection_name.to_sym, klass)
      end

      def merge_default_cursor!(options)
        options[:page] = DEFAULT_CURSOR unless options[:page]
      end

    end
  end
end