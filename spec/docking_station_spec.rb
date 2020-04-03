require "docking_station"

describe DockingStation do

  before(:each) do
    @bike = double(:bike)
    allow(@bike).to receive(:broken?) { false }
  end

  describe "#release_bike" do
    it "responds to 'release_bike' method" do
      expect(subject).to respond_to(:release_bike)
    end

    it "returns the bike" do
      subject.dock(@bike)
      expect(subject.release_bike).to eq @bike
    end
    
    it "doesn't realease a broken bike" do
      allow(@bike).to receive(:broken?) { true }
      subject.dock(@bike)
      expect { subject.release_bike }.to raise_error("This bike is broken")
    end

    it "gives an error message if there is no biked docked" do
      expect { subject.release_bike }.to raise_error("There is no bike available!")
    end

    it 'releases working bikes' do
      subject.dock(@bike)
      expect(subject.release_bike).to eq @bike
    end
  end

  describe "#dock" do
    it "stores Bike instances in an instance of DockingStation" do 
      expect(subject.dock(@bike)).to eq [@bike]
    end

    it "should be able to dock the default capacity of 20 bikes" do
      station = DockingStation.new
      DockingStation::DEFAULT_CAPACITY.times { station.dock(@bike) }
      expect(station.bikes.count).to eq(20)
    end

    it "should dock a bike in the DockingStation" do 
      subject.dock(@bike)
      expect(subject.bikes).to eq [@bike]
    end

    it "throws an error if capacity is full" do
      expect { (DockingStation.new::capacity + 1).times { subject.dock(@bike) } }.to raise_error("There is no space available!")
    end

    it "throws an error if capacity is full when initialized with a capacity of 19" do
      station = DockingStation.new(19)
      expect { (station::capacity + 1).times { station.dock(@bike) } }.to raise_error("There is no space available!")
    end

    it "throws an error if capacity is full when initialized with a capacity of 21" do
      station = DockingStation.new(21)
      expect { (station::capacity + 1).times { station.dock(@bike) } }.to raise_error("There is no space available!")
    end

    it 'should allow broken bikes to be docked' do
      allow(@bike).to receive(:broken?) { true }
      expect(subject.dock(@bike)).to eq [@bike]
    end
  end

end
