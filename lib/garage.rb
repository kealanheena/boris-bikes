class Garage

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def repair(bike)
    raise "This bike is already working" unless bike.broken?

    @bikes << bike
  end
end
