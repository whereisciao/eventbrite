require 'eventbrite/identity'

module Eventbrite
  class Team < Eventbrite::Identity
    attr_reader :name, :date_joined, :event_id

  end
end