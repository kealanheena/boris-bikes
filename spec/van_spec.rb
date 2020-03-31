require 'van.rb'

describe Van do

  before(:each) do
    @bike = double(:bike)
    allow(@bike).to receive(:broken?) { true }
    @dockingstation = double(:dockingstation)
    allow(@dockingstation).to receive(:bikes) { [@bike] }
  end

  describe '#collect' do
    it 'should collect broken bikes from the docking station' do
      van = Van.new
      expect(van.collect(@dockingstation)).to eq [@bike]
    end
  end

end