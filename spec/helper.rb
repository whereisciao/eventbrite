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

# Load Files in Support directory
Dir["./spec/support/**/*.rb"].sort.each {|f| require f}