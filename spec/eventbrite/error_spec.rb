require 'helper'

describe Eventbrite::Error do
  let(:client) { Eventbrite::REST::Client.new(oauth_token: "OT") }

  describe '.message' do
    subject { described_class.new('INVALID_AUTH', 'Invalid OAuth token.', 123) }
    its(:message) { should eq('INVALID_AUTH') }
  end

  describe '.description' do
    subject { described_class.new('INVALID_AUTH', 'Invalid OAuth token.', 123) }
    its(:description) { should eq('Invalid OAuth token.') }
  end

  describe '.code' do
    subject { described_class.new('INVALID_AUTH', 'Invalid OAuth token.', 123) }
    its(:code) { should eq(123) }
  end


  Eventbrite::Error.errors.each do |status, exception|
    context "when HTTP status is #{status}" do
      before do
        stub_get('/v3/users/me/').
          to_return(
            :status => status,
            :body => '{}',
            :headers => {:content_type => 'application/json; charset=utf-8'}
          )
      end

      it { expect { client.user_details }.to raise_error(exception) }
    end
  end
end