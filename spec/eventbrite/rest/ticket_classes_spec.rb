describe Eventbrite::REST::TicketClasses do
  let(:client) { Eventbrite::REST::Client.new(oauth_token:"TOKEN") }

  describe '.event_ticket_classes' do
    subject { client.event_ticket_classes('123456789') }

    before do
      stub_get('/v3/events/123456789/ticket_classes/').
        with(:query => {page:1}).
        to_return(
          :body => fixture('event_ticket_classes.json'),
          :headers => {:content_type => 'application/json; charset=utf-8'}
        )
    end

    it_behaves_like 'a cursor'
    it { subject; expect(a_get('/v3/events/123456789/ticket_classes/').with(:query => {page:1})).to have_been_made }
    its(:first) { should be_a_kind_of(Eventbrite::TicketClass) }

      # it { subject; expect(a_get('/v3/events/search/').with(:query => {page:1})).to have_been_made }
      # its(:first) { should be_a_kind_of(Eventbrite::Event) }
  end
end