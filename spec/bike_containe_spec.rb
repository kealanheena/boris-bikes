require 'bike_container'
require 'docking_station'
require 'van'
require 'garage'

shared_examples_for "a bike container" do
  let(:bike_container) { described_class.new }

  it "is initialized with an empty bikes array" do
    bike_container.bikes.should eq([])
  end

  it "is initialized a default capacity of 20" do
    bike_container.capacity.should eq(20)
  end

  context 'if initialized with 25 passed as an argument' do

    let(:bike_container) { described_class.new(25) }

    it "has a capacity of 25" do
      bike_container.capacity.should eq(25)
    end
  end

  context 'if initialized with 15 passed as an argument' do

    let(:bike_container) { described_class.new(15) }

    it "has a capacity of 15" do
      bike_container.capacity.should eq(15)
    end
  end
end

describe DockingStation do
  it_behaves_like "a bike container"
end

describe Van do
  it_behaves_like "a bike container"
end

describe Garage do
  it_behaves_like "a bike container"
end
