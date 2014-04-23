require 'helper'

describe Eventbrite::REST::Users do
  let(:client) { Eventbrite::REST::Client.new(oauth_token:"TOKEN") }

  describe '.user_details' do
    subject { client.user_details(user_id) }

    context 'Retrieve the authenticated User\'s Details' do
      let(:user_id) { 'me' }

      before do
        stub_get('/v3/users/me/').
          to_return(
            :body => fixture('user_details.json'),
            :headers => {:content_type => 'application/json; charset=utf-8'}
          )
      end

      it { subject; a_get('/v3/users/me/').should have_been_made }
      it { should be_a_kind_of(Eventbrite::User) }
    end
  end

  describe '.user_orders' do
    subject { client.user_orders('123456789') }

    before do
      stub_get('/v3/users/123456789/orders/').
        with(:query => {page:1}).
        to_return(
          :body => fixture('user_orders.json'),
          :headers => {:content_type => 'application/json; charset=utf-8'}
        )
    end

    it_behaves_like 'a cursor'
    it { subject; a_get('/v3/users/123456789/orders/').with(:query => {page:1}).should have_been_made }
    its(:first) { should be_a_kind_of(Eventbrite::Order) }
  end
end