require "./lib/docking_station"

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
      (DockingStation::DEFAULT_CAPACITY).times{ station.dock(@bike)}
      expect(station.bikes.count).to eq(20)
    end
  end

  describe "#dock" do
    it "check if the DockingStation has a bike" do 
      subject.dock(@bike)
      expect(subject.bikes).to eq [@bike]
    end

    it "check if the DockingStation has a bike" do 
      expect(subject.bikes).to eq []
    end

    it "gives an error if capacity is full" do
      expect { (DockingStation.new::capacity + 1 ).times { subject.dock(@bike) } }.to raise_error("There is no space available!")
    end

    it "gives an error if capacity is full" do
      station = DockingStation.new(19)
      expect { (station::capacity + 1 ).times { station.dock(@bike) } }.to raise_error("There is no space available!")
    end

    it "gives an error if capacity is full" do
      station = DockingStation.new(21)
      expect { (station::capacity + 1 ).times { station.dock(@bike) } }.to raise_error("There is no space available!")
    end

    it 'should allow broken bikes to be docked' do
      allow(@bike).to receive(:broken?) { true }
      expect(subject.dock(@bike)).to eq [@bike]
    end
  end

  describe "#initilize" do
    it "capacity should equal 25 when 25 is passed as an argument" do
      expect(DockingStation.new(25).capacity).to eq(25)
    end
    
    it "capacity should equal 20 when no argument is passed" do
      expect(subject::capacity).to eq(20)
    end
  end
end

