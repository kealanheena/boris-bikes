require "bikes"

describe Bike do
  describe '#broken'do
    it "responds to 'broken?' method" do
      expect(subject).respond_to? (:broken?)
    end
  end

  describe '#report' do
    it 'can be reported as broken' do
      expect(subject.report).to eq(true)
    end
  end
end