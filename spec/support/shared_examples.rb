shared_examples 'a cursor' do
  it { should be_a_kind_of(Eventbrite::Cursor) }
end

shared_examples 'a timestamp attribute' do
  context 'is null' do
    let(:timestamp) { nil }

    it { should be_nil }
  end

  context 'is \'2014-12-01T22:59:59Z\'' do
    let(:timestamp) { '2014-12-01T22:59:59Z' }

    it { should be_a_kind_of(Time) }
    it { should eq(Time.parse('2014-12-01T22:59:59Z')) }
  end
end