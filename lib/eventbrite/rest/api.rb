require 'eventbrite/rest/oauth'
require 'eventbrite/rest/events'

module Eventbrite
  module REST
    module API
      include Eventbrite::REST::OAuth
      include Eventbrite::REST::Events
    end
  end
end
