unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_filter '/spec/'
    minimum_coverage(99.15)
  end
end

ENV['RACK_ENV'] = "test"

require 'eventbrite'
require 'rspec'
require 'webmock/rspec'
require 'pry'

def a_delete(path)
  a_request(:delete, Eventbrite::REST::Client::ENDPOINT + path)
end

def a_get(path)
  a_request(:get, Eventbrite::REST::Client::ENDPOINT + path)
end

def a_post(path)
  a_request(:post, Eventbrite::REST::Client::ENDPOINT + path)
end

def a_put(path)
  a_request(:put, Eventbrite::REST::Client::ENDPOINT + path)
end

def stub_delete(path)
  stub_request(:delete, Eventbrite::REST::Client::ENDPOINT + path)
end

def stub_get(path)
  stub_request(:get, Eventbrite::REST::Client::ENDPOINT + path)
end

def stub_post(path)
  stub_request(:post, Eventbrite::REST::Client::ENDPOINT + path)
end

def stub_put(path)
  stub_request(:put, Eventbrite::REST::Client::ENDPOINT + path)
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end