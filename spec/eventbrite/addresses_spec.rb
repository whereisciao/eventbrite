require 'helper'

describe Eventbrite::Addresses do
  subject { described_class.new(data) }

  context 'All nil' do
    let(:data) { nil }

    its(:home) { should be_nil }
    its(:work) { should be_nil }
    its(:ship) { should be_nil }

    its(:home_address_1) { should be_nil }
    its(:home_address_2) { should be_nil }
    its(:home_city) { should be_nil }
    its(:home_country) { should be_nil }
    its(:home_country_name) { should be_nil }
    its(:home_latitude) { should be_nil }
    its(:home_longitude) { should be_nil }
    its(:home_postal_code) { should be_nil }
    its(:home_region) { should be_nil }
  end

  context 'Home Address Populated' do
    let(:data) { build :home_addresses }

    its(:home) { should be_kind_of(Eventbrite::Address) }
    its(:work) { should be_nil }
    its(:ship) { should be_nil }

    its(:home_address_1) { should eq(data[:home][:address_1]) }
    its(:home_address_2) { should eq(data[:home][:address_2]) }
    its(:home_city) { should eq(data[:home][:city]) }
    its(:home_country) { should eq(data[:home][:country]) }
    its(:home_country_name) { should eq(data[:home][:country_name]) }
    its(:home_latitude) { should eq(data[:home][:latitude]) }
    its(:home_longitude) { should eq(data[:home][:longitude]) }
    its(:home_postal_code) { should eq(data[:home][:postal_code]) }
    its(:home_region) { should eq(data[:home][:region]) }
  end
end