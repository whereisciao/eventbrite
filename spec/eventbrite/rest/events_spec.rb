require 'helper'

describe Eventbrite::REST::Events do
  let(:client) { Eventbrite::REST::Client.new(oauth_token:"TOKEN") }

  describe '.event_search' do
    context 'default public search' do
      subject { client.event_search }

      before do
        stub_get('/v3/events/search/').
          with(:query => {page:1}).
          to_return(
            :body => fixture('event_search.json'),
            :headers => {:content_type => 'application/json; charset=utf-8'}
          )
      end

      it_behaves_like 'a cursor'
      it { subject; a_get('/v3/events/search/').with(:query => {page:1}).should have_been_made }
      its(:first) { should be_a_kind_of(Eventbrite::Event) }
    end
  end

  describe '.event_categories' do
    subject { client.event_categories }

    before do
      stub_get('/v3/categories/').
        to_return(
          :body => fixture('event_categories.json'),
          :headers => {:content_type => 'application/json; charset=utf-8'}
        )
    end

    it { should be_a_kind_of(Array) }
    it { subject; a_get('/v3/categories/').should have_been_made }
    its(:first) { should be_a_kind_of(Eventbrite::Resource) }
  end

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

    it_behaves_like 'a cursor'
    it { subject; a_get('/v3/events/123456789/orders/').with(:query => {page:1}).should have_been_made }
    its(:first) { should be_a_kind_of(Eventbrite::Order) }
  end

  describe '.event_attendees' do
    subject { client.event_attendees('123456789') }

    before do
      stub_get('/v3/events/123456789/attendees/').
        with(:query => {page:1}).
        to_return(
          :body => fixture('event_attendees.json'),
          :headers => {:content_type => 'application/json; charset=utf-8'}
        )
    end

    it_behaves_like 'a cursor'
    it { subject; a_get('/v3/events/123456789/attendees/').with(:query => {page:1}).should have_been_made }
    its(:first) { should be_a_kind_of(Eventbrite::Attendee) }
  end

  describe '.event_attendees_detail' do
    subject { client.event_attendees_detail('10623123047','322951239') }

    before do
      stub_get('/v3/events/10623123047/attendees/322951239/').
        to_return(
          :body => fixture('event_attendees_detail.json'),
          :headers => {:content_type => 'application/json; charset=utf-8'}
        )
    end

    it { subject; a_get('/v3/events/10623123047/attendees/322951239/').should have_been_made }
    it { should be_a_kind_of(Eventbrite::Attendee) }
  end

  describe '.event_discounts' do
    subject { client.event_discounts('123456789') }

    before do
      stub_get('/v3/events/123456789/discounts/').
        with(:query => {page:1}).
        to_return(
          :body => fixture('event_discounts.json'),
          :headers => {:content_type => 'application/json; charset=utf-8'}
        )
    end

    it_behaves_like 'a cursor'
    it { subject; a_get('/v3/events/123456789/discounts/').with(:query => {page:1}).should have_been_made }
    its(:first) { should be_a_kind_of(Eventbrite::Discount) }
  end

  describe '.event_access_codes' do
    subject { client.event_access_codes('123456789') }

    before do
      stub_get('/v3/events/123456789/access_codes/').
        with(:query => {page:1}).
        to_return(
          :body => fixture('event_access_codes.json'),
          :headers => {:content_type => 'application/json; charset=utf-8'}
        )
    end

    it_behaves_like 'a cursor'
    it { subject; a_get('/v3/events/123456789/access_codes/').with(:query => {page:1}).should have_been_made }
    its(:first) { should be_a_kind_of(Eventbrite::AccessCode) }
  end
end