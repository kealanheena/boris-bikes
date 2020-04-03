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
    allow(@dockingstation).to receive(:empty?) { false }
    allow(@dockingstation).to receive(:full?) { false }
    allow(@garage).to receive(:bikes) { [] }
    allow(@garage).to receive(:empty?) { false }
    allow(@garage).to receive(:full?) { false }
  end

  describe '#initialize' do
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
      expect(subject.station_collection(@dockingstation)).to eq [@bike]
    end

    it 'should throw an error when the docking station is empty' do
      allow(@dockingstation).to receive(:empty?) { true }
      expect { subject.station_collection(@dockingstation) }.to raise_error("There is no bikes to collect!")

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

  describe '#garage_collection' do
    it 'should only collect the working bikes from a garage' do
      allow(@garage).to receive(:bikes) { [@bike, @bike2] }
      expect(subject.garage_collection(@garage)).to eq [@bike2]
    end

    it 'should throw an error if the garage is empty' do
      allow(@garage).to receive(:empty?) { true }
      expect { subject.garage_collection(@garage) }.to raise_error("There is no bikes to collect!")
    end

    it 'should not collect bikes if the van is full' do
      allow(@garage).to receive(:bikes) { [@bike, @bike2] }
      allow(subject).to receive(:full?) { true }
      expect { subject.garage_collection(@garage) }.to raise_error("There is no space available!")
    end
  end

  describe '#station_delivery' do
    it 'should deliver the working bikes to the docking station' do
      subject.bikes << @bike
      subject.bikes << @bike2
      allow(subject).to receive(:empty?) { false }
      expect(subject.station_delivery(@dockingstation)).to eq [@bike]
    end

    it 'should raise an error if the van is empty' do
      expect { subject.station_delivery(@dockingstation) }.to raise_error("There's no bikes in this van")
    end

    it 'should raise an error if the docking station is full is empty' do
      allow(subject).to receive(:empty?) { false }
      allow(@dockingstation).to receive(:full?) { true }
      expect { subject.station_delivery(@dockingstation) }.to raise_error("There is no space available!")
    end
  end

  describe '#garage_delivery' do
    it 'should deliver the broken bikes to the garage' do
      subject.station_collection(@dockingstation)
      expect(subject.garage_delivery(@garage)).to eq []
    end

    it 'should not deliver bikes when the garage is full' do
      allow(@garage).to receive(:full?) { true }
      allow(subject).to receive(:empty?) { false }
      expect { subject.garage_delivery(@garage) }.to raise_error("There is no space available!")
    end

    it 'should raise an error if the van is empty' do
      expect { subject.garage_delivery(@garage) }.to raise_error("There's no bikes in this van")
    end
  end
end
