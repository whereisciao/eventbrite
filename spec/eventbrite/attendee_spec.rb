require 'helper'

describe Eventbrite::Attendee, focus: true do
  let(:attendee) { described_class.new(data) }

  context 'From event_attendees_detail.json' do
    let(:data) { fixture_json('event_attendees_detail.json') }

    subject { attendee }

    its(:resource_uri) { should eq("https://www.eventbriteapi.com/v3/events/1234567/attendees/7654321/") }
    its(:id) { should eq("7654321") }
    its(:quantity) { should eq(1) }
    its(:ticket_class_id) { should eq("19283") }
    its(:checked_in) { should eq(false) }
    its(:cancelled) { should eq(false) }
    its(:refunded) { should eq(false) }
    its(:affiliate) { should eq("EB Ref") }
    its(:status) { should eq("Attending") }
    its(:event_id) { should eq("567") }
    its(:order_id) { should eq("456") }

    describe '.profile' do
      subject { attendee.profile }

      its(:first_name) { should eq("Joe") }
      its(:last_name)  { should eq("Example") }
      its(:gender)     { should eq("male") }
      its(:email)      { should eq("examplea@example.com") }
      its(:name)       { should eq("Joe Example") }

      describe '.addresses.home' do
        subject { attendee.profile.addresses.home }

        its(:city)        { should eq("Springfield") }
        its(:country)     { should eq("US") }
        its(:region)      { should eq("IL") }
        its(:postal_code) { should eq("555555") }
        its(:address_1)   { should eq("123 Main Street") }
        its(:address_2)   { should eq("") }
      end

      describe '.addresses.ship' do
        subject { attendee.profile.addresses.ship }

        it { should be_nil }
      end

      describe '.addresses.work' do
        subject { attendee.profile.addresses.work }

        it { should be_nil }
      end
    end

    describe '.barcodes.first' do
      subject { attendee.barcodes.first }

      its(:status) { should eq("unused") }
      its(:barcode) { should eq("0000000000000001001") }
      its(:checkin_type) { should eq(0) }
    end

    describe '.answers.first' do
      subject { attendee.answers.first }

      its(:answer)      { should eq("Mens XL") }
      its(:type)        { should eq("multiple_choice") }
      its(:question)    { should eq("What size tshirt are you?")}
      its(:question_id) { should eq("53") }
    end

    describe '.costs.gross' do
      subject { attendee.costs.gross }

      its(:currency) { should eq("USD") }
      its(:display) { should eq("$25.00") }
      its(:value) { should eq(2500) }
    end

    describe '.costs.eventbrite_fee' do
      subject { attendee.costs.eventbrite_fee }

      its(:currency) { should eq("USD") }
      its(:display) { should eq("$1.13") }
      its(:value) { should eq(113) }
    end

    describe '.event.start' do
      subject { attendee.event.start }

      its(:utc) { should eq("2015-02-07T00:30:00Z") }
      its(:local) { should eq("2015-02-06T18:30:00") }
      its(:timezone) { should eq("America/Chicago") }
    end

    describe '.event.currency' do
      subject { attendee.event.currency }

      it { should eq ("USD") }
    end

    describe '.order.costs.gross' do
      subject { attendee.order.costs.gross }

      its(:currency) { should eq("USD") }
      its(:display) { should eq("$25.00") }
      its(:value) { should eq(2500) }
    end
  end
end