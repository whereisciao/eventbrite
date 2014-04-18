require 'eventbrite/base'

module Eventbrite
  class Email < Eventbrite::Base
    attr_reader :email, :verified, :primary
  end
end