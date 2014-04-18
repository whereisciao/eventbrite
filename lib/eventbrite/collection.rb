require 'memoizable'
require 'eventbrite/enumerable'

module Eventbrite
  class Collection
    include Eventbrite::Enumerable
    include Memoizable

    def initialize(collection)
      @collection = Array(collection).collect do |object|
        member_class.new(object)
      end
    end

    def member_class
      raise "Member Class should be defined by child class"
    end
  end
end