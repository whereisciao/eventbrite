require 'helper'

describe Eventbrite::NullObject do
  let(:instance) { described_class.new }

  describe '.nil?' do
    subject { instance.nil? }

    it { should be_true }
  end
end