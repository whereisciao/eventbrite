require 'eventbrite/base'

module Eventbrite
  class Answer < Eventbrite::Base
    attr_reader :answer, :type, :question, :question_id
  end
end