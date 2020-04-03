require 'garage'

describe Garage do

  before(:each) do
    @bike = double(:bike)
    @bike2 = double(:bike)
    allow(@bike).to receive(:broken?) { true }
    allow(@bike2).to receive(:broken?) { false }
  end
  
  describe '#repair' do
    it 'should repair the broken bike' do
      garage = Garage.new
      allow(garage).to receive(:present?).with(@bike) { true }
      garage.repair(@bike)
      expect(garage.bikes).to eq [@bike]
    end

    it 'should raise an error if the bike isn\'t broken' do
      garage = Garage.new
      expect { garage.repair(@bike2) }.to raise_error("This bike is already working")
    end

    it 'should raise error if the bike isn\'t in the garage' do
      garage = Garage.new
      expect { garage.repair(@bike) }.to raise_error("This bike isn't in this garage")
    end
  end
end
