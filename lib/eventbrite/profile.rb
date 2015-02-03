require 'eventbrite/base'

module Eventbrite
  class Profile < Eventbrite::Base
    attr_reader :age, :birth_date, :blog, :cell_phone, :company,
      :email, :first_name, :gender, :home_phone, :job_title,
      :last_name, :name, :prefix, :suffix, :website, :work_phone

    object_attr_reader :Addresses, :addresses
  end
end