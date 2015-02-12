require 'helper'

describe Eventbrite::REST::UserOrganizers, focus: true do
  let(:client) { Eventbrite::REST::Client.new(oauth_token:"TOKEN")}

  let(:params) do
    {
      "organizer.name" => "Event Action Team",
      "organizer.description.html" => "A guy, a girl, and an event planner"
    }
  end

  describe '.create_user_organizer' do
    subject { client.create_user_organizer(params) }

    before do
      stub_post('/v3/organizers/').
        with(params).
        to_return(
          body: fixture('user_organizer.json'),
          headers: {content_type: 'application/json; charset=utf-8'}
        )
    end

    it { should be_kind_of(Eventbrite::Organizer) }
    it { subject; a_post('/v3/organizers/').with(params).should have_been_made }
  end

  describe '.update_user_organizer' do
    subject { client.update_user_organizer(organizer_id, params) }

    before do
      stub_post("/v3/organizers/#{organizer_id}/").
       with(params).
       to_return(
          body: fixture('user_organizer.json'),
          headers: {content_type: 'application/json; charset=utf-8'}
       )
    end

    let(:organizer_id) { rand(100) }

    it { should be_kind_of(Eventbrite::Organizer) }
    it { subject; a_post("/v3/organizers/#{organizer_id}/").with(params).should have_been_made }
  end

  describe '.list_user_organizers' do
  end
end