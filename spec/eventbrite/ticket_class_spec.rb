require 'helper'

describe Eventbrite::TicketClass do
  describe '.sales_start' do
    subject { described_class.new(id: "22315349", sales_start:timestamp).sales_start }

    it_behaves_like 'a timestamp attribute'
  end

  describe '.sales_end' do
    subject { described_class.new(id: "22315349", sales_end:timestamp).sales_end }

    it_behaves_like 'a timestamp attribute'
  end
end