require 'van.rb'

describe Van do

  before(:each) do
    @bike = double(:bike)
    @bike2 = double(:bike)
    allow(@bike).to receive(:broken?) { true }
    allow(@bike2).to receive(:broken?) { false }
    @dockingstation = double(:dockingstation)
    allow(@dockingstation).to receive(:bikes) { [@bike, @bike2] }
  end

  describe '#collect' do
    it 'should collect broken bikes from the docking station' do
      van = Van.new
      expect(van.collect(@dockingstation)).to eq [@bike]
    end

    it 'should only collect the broken bikes' do 
      van = Van.new
      expect(van.collect(@dockingstation)).to eq [@bike]
    end
  end

end