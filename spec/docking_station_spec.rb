require "./lib/docking_station"

describe DockingStation do
  describe "#release_bike" do
    it "responds to 'release_bike' method" do
      expect(subject).to respond_to(:release_bike)
    end

    it "returns an instance of bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to be_instance_of Bike
    end
    
    it "returns true to the working? method" do
      bike = Bike.new
      expect(bike.working?).to eq true
    end

    it "gives an error message if there is no biked docked" do
      expect { subject.release_bike }.to raise_error("There is no bike available!")
    end
  end

  describe "#dock" do
    it "stores Bike instances in an instance of DockingStation" do 
      # bike = subject.release_bike
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end
  end

  describe "#docked_bike" do
    it "check if the DockingStation has a bike" do 
      # bike = subject.release_bike
      bike = Bike.new
      subject.dock(bike)
      expect(subject.docked_bike).to eq bike
    end

    it "check if the DockingStation has a bike" do 
      expect(subject.docked_bike).to eq nil
    end
  end

end

