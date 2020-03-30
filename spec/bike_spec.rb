require "bikes"

describe Bike do
  describe '#broken'do
    it "responds to 'broken?' method" do
      expect(subject).respond_to? (:broken?)
    end
  end

  describe '#report' do
    it 'can be reported as broken' do
      subject.report
      expect(subject.broken?).to eq(true)
    end
  end
end