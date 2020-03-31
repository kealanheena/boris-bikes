require 'van'

describe Van do

  before(:each) do
    @bike = double(:bike)
    @bike2 = double(:bike)
    @dockingstation = double(:dockingstation)
    @garage = double(:garage)
    allow(@bike).to receive(:broken?) { true }
    allow(@bike2).to receive(:broken?) { false }
    allow(@dockingstation).to receive(:bikes) { [@bike, @bike2] }
    allow(@garage).to receive(:bikes) { [] }
  end

  describe '#collect' do
    it 'should only collect the broken bikes if the container is a docking station' do 
      van = Van.new
      expect(van.collect(@dockingstation)).to eq [@bike]
    end
  end

  describe '#deliver' do
    it 'should deliver the broken bikes to the garage' do
      van = Van.new
      van.collect(@dockingstation)
      expect(van.deliver(@garage)).to eq []
    end
  end
end
