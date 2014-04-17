require 'eventbrite/base'

module Eventbrite
  class HtmlString < Eventbrite::Base
    attr_reader :text, :html
  end
end
