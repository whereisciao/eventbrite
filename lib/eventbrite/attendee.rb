require 'eventbrite/creatable'
require 'eventbrite/changeable'
require 'eventbrite/identity'

module Eventbrite
  class Attendee < Eventbrite::Identity
    include Eventbrite::Creatable
    include Eventbrite::Changeable

    attr_reader :affiliate, :cancelled, :checked_in, :event_id,
        :order_id, :quantity, :refunded, :resource_uri, :status,
        :ticket_class_id

    object_attr_reader :Event, :event
    object_attr_reader :Order, :order
    object_attr_reader :Team, :team
    object_attr_reader :Costs, :costs
    object_attr_reader :Profile, :profile
    object_attr_reader :Barcodes, :barcodes
    object_attr_reader :Answers, :answers

    delegate :age, :birth_date, :blog, :cell_phone, :company,
      :email, :first_name, :gender, :home_phone, :job_title,
      :last_name, :name, :prefix, :suffix, :website, :work_phone,
        to: :profile, allow_nil: true
  end
end