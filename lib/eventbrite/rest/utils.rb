require 'eventbrite/request'

module Eventbrite
  module REST
    module Utils
      URI_SUBSTRING = '://'
      DEFAULT_CURSOR = -1

      def extract_id(object)
        case object
        when ::Integer
          object
        when ::String
          object.split('/').last.to_i
        when URI
          object.path.split('/').last.to_i
        when Eventbrite::Identity
          object.id
        end
      end

      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @param klass [Class]
      def perform_with_object(request_method, path, options, klass)
        request = Eventbrite::Request.new(self, request_method, path, options)
        request.perform_with_object(klass)
      end
    end
  end
end