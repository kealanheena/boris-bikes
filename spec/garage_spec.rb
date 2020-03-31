require 'garage'

describe Garage do

  before(:each) do
    @bike = double(:bike)
    allow(@bike).to receive(:broken?) { true }
  end
  
  describe '#repair' do
    it 'should repair the broken bikes' do
      garage = Garage.new
      garage.repair(@bike)
      expect(garage.fixed_bikes).to eq [@bike]
    end
  end
end
