require 'garage'

describe Garage do

  before(:each) do
    @bike = double(:bike)
    @bike2 = double(:bike)
    allow(@bike).to receive(:broken?) { true }
    allow(@bike2).to receive(:broken?) { false }
  end
  
  describe '#repair' do
    it 'should repair the broken bikes' do
      garage = Garage.new
      garage.repair(@bike)
      expect(garage.fixed_bikes).to eq [@bike]
    end

    it 'should raise an error if the bike isn\'t broken' do
      garage = Garage.new
      expect { garage.repair(@bike2) }.to raise_error("This bike is already working")
    end
  end
end
