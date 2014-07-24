require 'faraday'
require 'faraday/request/multipart'
require 'json'
require 'timeout'
require 'eventbrite/client'
require 'eventbrite/rest/api'
require 'eventbrite/rest/response/parse_json'
require 'eventbrite/rest/response/raise_error'

module Eventbrite
  module REST
    class Client < Eventbrite::Client
      include Eventbrite::REST::API
      attr_accessor :bearer_token

      # @return [Hash]
      def connection_options
        @connection_options ||= {
          :builder => middleware,
          :headers => {
            :accept => 'application/json',
            :user_agent => user_agent,
          },
          :request => {
            :open_timeout => 10,
            :timeout => 30,
          },
        }
      end

      def middleware
        @middleware ||= Faraday::RackBuilder.new do |faraday|
          # Checks for files in the payload, otherwise leaves everything untouched
          faraday.request :multipart
          # Encodes as "application/x-www-form-urlencoded" if not already encoded
          faraday.request :url_encoded
          # Handle error responses
          faraday.response :raise_error
          # Parse JSON response bodies
          faraday.response :parse_json
          # Set default HTTP adapter
          faraday.adapter :net_http
        end
      end

      # Perform an HTTP GET request
      def get(version, path, params = {})
        headers = request_headers(:get, path, params)
        request(:get, version, path, params, headers)
      end

    # private
      def connection(version)
        case(version)
        when :v3
          connection_v3
        else
          raise "#{version} Connection is undefined"
        end
      end

      def request(method, version, path, params = {}, headers = {})
        connection(version).send(method.to_sym, path, params) { |request| request.headers.update(headers) }.env
      end

      def request_headers(method, path, params = {}, signature_params = params)
        bearer_token_request = params.delete(:bearer_token_request)
        headers = {}
        if bearer_token_request
          headers[:accept]        = '*/*'
          headers[:authorization] = bearer_token_credentials_auth_header
          headers[:content_type]  = 'application/x-www-form-urlencoded; charset=UTF-8'
        else
          headers[:authorization] = auth_header(method, path, params, signature_params)
        end
        headers
      end

      def auth_header(method, path, params = {}, signature_params = params)
        bearer_auth_header
      end

      def bearer_token
        oauth_token
      end
      alias_method :token, :bearer_token

      def bearer_auth_header
        "Bearer #{token}"
      end

    end
  end
end