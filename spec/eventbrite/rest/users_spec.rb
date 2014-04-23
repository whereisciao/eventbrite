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
end