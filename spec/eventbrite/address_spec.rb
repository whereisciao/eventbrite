require 'helper'

describe Eventbrite::Address do
  subject { described_class.new(data) }

  let(:data) { build :address }

  its(:address_1)    { should eq(data[:address_1]) }
  its(:address_2)    { should eq(data[:address_2]) }
  its(:city)         { should eq(data[:city]) }
  its(:country)      { should eq(data[:country]) }
  its(:country_name) { should eq(data[:country_name]) }
  its(:latitude)     { should eq(data[:latitude]) }
  its(:longitude)    { should eq(data[:longitude]) }
  its(:postal_code)  { should eq(data[:postal_code]) }
  its(:region)       { should eq(data[:region]) }

end