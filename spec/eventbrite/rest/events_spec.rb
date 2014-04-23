require 'helper'

describe Eventbrite::REST::Events do
  let(:client) { Eventbrite::REST::Client.new(oauth_token:"TOKEN") }

  describe '.event_details' do
    subject { client.event_details('10851193211') }

    before do
      stub_get('/v3/events/10851193211/').to_return(:body => fixture('event_details.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end

    it { subject; a_get('/v3/events/10851193211/').should have_been_made }
    it { should be_a_kind_of(Eventbrite::Event) }
  end

  describe '.event_orders' do
  end

  describe '.event_attendees' do
  end
end