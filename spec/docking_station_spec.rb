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


end

