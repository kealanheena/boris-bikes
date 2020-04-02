require "bikes"

describe Bike do
  describe '#working' do
    it "responds to 'working?' method" do
      expect(subject).respond_to?(:working?)
    end

    it "should be working when initialized" do
      expect(subject.working?).to eq true
    end
  end

  describe '#broken' do
    it "responds to 'broken?' method" do
      expect(subject).respond_to?(:broken?)
    end

    it "should not be broken when initialized" do
      expect(subject.broken?).to be_falsey
    end

    it "should return true when broken? is called after being reported" do
      bike = Bike.new
      bike.report
      expect(bike.broken?).to eq true
    end
  end

  describe '#report' do
    it 'can be reported as broken' do
      subject.report
      expect(subject.broken?).to eq(true)
    end
  end
end
