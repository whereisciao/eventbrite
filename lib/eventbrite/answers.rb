require 'eventbrite/collection'

module Eventbrite
  class Answers < Eventbrite::Collection
    def member_class
      Answer
    end
  end
end