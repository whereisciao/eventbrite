require 'helper'

describe Eventbrite::Order do
  let(:order) { described_class.new(data)}

  context 'From order_details.json' do
    let(:data) { fixture_json('order_details.json') }

    subject { order }

    its(:id) { should eq("388431456") }
    its(:event_id) { should eq("14879788849") }

    describe ".event.name" do
      subject { order.event.name }

      its(:text) { should eq("Example Event") }
    end
  end
end