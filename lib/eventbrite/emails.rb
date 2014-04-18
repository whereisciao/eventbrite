require 'memoizable'
require 'eventbrite/enumerable'

module Eventbrite
  class Emails
    include Eventbrite::Enumerable
    include Memoizable

    def initialize(collection)
      @collection = Array(collection).collect do |email|
        Email.new(email)
      end
    end
  end
end