require 'eventbrite/base'

module Eventbrite
  class Paginatable < Base
    attr_reader :object_count, :page_number, :page_size, :page_count
  end
end