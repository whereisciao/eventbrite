require 'helper'

describe Eventbrite::Event do
  let(:instance) { described_class.new(json_fixture)}
  let(:json_fixture) { fixture_json('event.json') }

  it_behaves_like 'creatable'
  it_behaves_like 'changeable'

end