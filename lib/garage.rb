class Garage

  attr_reader :fixed_bikes

  def initialize
    @fixed_bikes = []
  end

  def repair(bike)
    @fixed_bikes << bike
  end
end
