require 'eventbrite/rest/oauth'
require 'eventbrite/rest/events'
require 'eventbrite/rest/users'

module Eventbrite
  module REST
    module API
      include Eventbrite::REST::OAuth
      include Eventbrite::REST::Events
      include Eventbrite::REST::Users
    end
  end
end
