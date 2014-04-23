require 'helper'

describe Eventbrite::REST::Events do
  let(:client) { Eventbrite::REST::Client.new(oauth_token:"TOKEN") }

  describe '.event_details' do
    subject { client.event_details('123456789') }

    before do
      stub_get('/v3/events/123456789/').
        to_return(
          :body => fixture('event_details.json'),
          :headers => {:content_type => 'application/json; charset=utf-8'}
        )
    end

    it { subject; a_get('/v3/events/123456789/').should have_been_made }
    it { should be_a_kind_of(Eventbrite::Event) }
  end

  describe '.event_orders' do
    subject { client.event_orders('123456789') }

    before do
      stub_get('/v3/events/123456789/orders/').
        with(:query => {page:1}).
        to_return(
          :body => fixture('event_orders.json'),
          :headers => {:content_type => 'application/json; charset=utf-8'}
        )
    end

    it { subject; a_get('/v3/events/123456789/orders/').with(:query => {page:1}).should have_been_made }
    it_behaves_like 'a cursor'
  end

  describe '.event_attendees' do
  end
end