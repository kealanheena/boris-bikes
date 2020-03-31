class Garage

  attr_reader :fixed_bikes

  def initialize
    @fixed_bikes = []
  end

  def repair(bike)
    raise "This bike is already working" unless bike.broken?

    @fixed_bikes << bike
  end
end
