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

shared_examples 'creatable' do
  describe '.created' do
    subject { instance.created }

    it { should eq(Time.parse(json_fixture[:created])) }
  end

  describe '.created?' do
    subject { instance.created? }

    it { should be_true }
  end
end

shared_examples 'changeable' do
  describe '.changed' do
    subject { instance.changed }

    it { should eq(Time.parse(json_fixture[:changed])) }
  end

  describe '.changed?' do
    subject { instance.changed? }

    it { should be_true }
  end
end