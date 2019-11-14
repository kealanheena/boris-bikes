require "./lib/docking_station"

describe DockingStation do
  describe "#release_bike" do
    it "responds to 'release_bike' method" do
      expect(subject).to respond_to(:release_bike)
    end

    it "returns an instance of bike" do
      expect(subject.release_bike).to be_instance_of Bike
    end
    
    it "returns true to the working? method" do
      bike = subject.release_bike
      expect(bike.working?).to eq true
    end
  end

  describe "#dock" do
    it "stores Bike instances in an instance of DockingStation" do 
      bike = subject.release_bike
      expect(subject.dock(bike)).to eq bike
    end
  end

  describe "#docked_bike" do
    it "check if the DockingStation has a bike" do 
      bike = subject.release_bike
      subject.dock(bike)
      expect(subject.docked_bike).to eq bike
    end

    it "check if the DockingStation has a bike" do 
      expect(subject.docked_bike).to eq nil
    end
  end

end

