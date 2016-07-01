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
      it { subject; expect(a_get('/v3/events/search/').with(:query => {page:1})).to have_been_made }
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
    it { subject; expect(a_get('/v3/categories/')).to have_been_made }
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

    it { subject; expect(a_get('/v3/events/123456789/')).to have_been_made }
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
    it { subject; expect(a_get('/v3/events/123456789/orders/').with(:query => {page:1})).to have_been_made }
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
    it { subject; expect(a_get('/v3/events/123456789/attendees/').with(:query => {page:1})).to have_been_made }
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

    it { subject; expect(a_get('/v3/events/10623123047/attendees/322951239/')).to have_been_made }
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
    it { subject; expect(a_get('/v3/events/123456789/discounts/').with(:query => {page:1})).to have_been_made }
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
    it { subject; expect(a_get('/v3/events/123456789/access_codes/').with(:query => {page:1})).to have_been_made }
    its(:first) { should be_a_kind_of(Eventbrite::AccessCode) }
  end

  describe '.event_transfers' do
    subject { client.event_transfers('123456789') }

    before do
      stub_get('/v3/events/123456789/transfers/').
        with(:query => {page:1}).
        to_return(
          :body => fixture('event_transfers.json'),
          :headers => {:content_type => 'application/json; charset=utf-8'}
        )
    end

    it_behaves_like 'a cursor'
    it { subject; expect(a_get('/v3/events/123456789/transfers/').with(:query => {page:1})).to have_been_made }
    its(:first) { should be_a_kind_of(Eventbrite::Transfer) }
  end

  describe '.event_create' do
    subject { client.event_create(event_params) }

    let(:event_params) {
      {
        "event.name.html" => event_name_html,
        "event.start.utc" => event_start_utc,
        "event.start.timezone" => event_start_timezone,
        "event.end.utc" => event_end_utc,
        "event.end.timezone" => event_end_timezone,
        "event.currency" => event_currency
      }
    }

    let(:event_name_html) { "CHAU TEST" }
    let(:event_start_utc) { "2016-07-04T16:11:51Z" }
    let(:event_start_timezone) { "America/Los_Angeles" }
    let(:event_end_utc) { "2016-06-28T16:00:48Z" }
    let(:event_end_timezone) { "America/Los_Angeles" }
    let(:event_currency) { "USD" }

    before do
      stub_post('/v3/events/').
      with(body: event_params).
      to_return(
        :body => fixture('event_create.json'),
        :headers => {:content_type => 'application/json; charset=utf-8'}
      )
    end

    it { subject; expect(a_post('/v3/events/')).to have_been_made }
    it { should be_a_kind_of(Eventbrite::Event) }
    its("name.html") { should eq(event_name_html) }
    let("start.utc") { "2016-07-04T16:11:51Z" }
    let("start.timezone") { "America/Los_Angeles" }
    let("end.utc") { "2016-06-28T16:00:48Z" }
    let("end.timezone") { "America/Los_Angeles" }
    let("currency") { "USD" }

  end
end