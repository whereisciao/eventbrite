require 'helper'

describe Eventbrite::Client do
  let(:instance) { described_class.new(oauth_token: oauth_token) }
  let(:oauth_token) { "OAUTH_TOKEN" }

  describe '.credentials' do
    subject { instance.credentials }

    it { should be_kind_of(Hash) }
    it { should include(token: oauth_token)}
  end
end