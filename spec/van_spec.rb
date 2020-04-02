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

  describe 'initialize' do
    it 'should have a default capacity of 20' do
      expect(subject::capacity).to eq(20)
    end

    it 'should have a capacity of 25 when 25 is passed as an argument' do
      van = Van.new(25)
      expect(van::capacity).to eq(25)
    end

    it 'should have a capacity of 25 when 25 is passed as an argument' do
      van = Van.new(15)
      expect(van::capacity).to eq(15)
    end
  end

  describe '#station_collection' do
    it 'should only collect the broken bikes from a docking station' do 
      van = Van.new
      expect(van.station_collection(@dockingstation)).to eq [@bike]
    end

    it 'should throw an error if it tries to collect at bike while at full capacity' do
      allow(@dockingstation).to receive(:bikes) { [@bike] }
      20.times { subject.station_collection(@dockingstation) }
      expect { subject.station_collection(@dockingstation) }.to raise_error("There is no space available!")
    end

    it 'should throw an error if it tries to collect at bike while at full capacity' do
      van = Van.new(19)
      allow(@dockingstation).to receive(:bikes) { [@bike] }
      19.times { van.station_collection(@dockingstation) }
      expect { van.station_collection(@dockingstation) }.to raise_error("There is no space available!")
    end

    it 'should throw an error if it tries to collect at bike while at full capacity' do
      van = Van.new(21)
      allow(@dockingstation).to receive(:bikes) { [@bike] }
      21.times { van.station_collection(@dockingstation) }
      expect { van.station_collection(@dockingstation) }.to raise_error("There is no space available!")
    end
  end

  # describe '#deliver' do
  #   it 'should deliver the broken bikes to the garage' do
  #     van = Van.new
  #     van.collect(@dockingstation)
  #     expect(van.deliver(@garage)).to eq []
  #   end
  # end
end
