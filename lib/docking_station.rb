require "./lib/bikes"

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "There is no bike available!" if @bikes.count < 1
    @bikes.pop
  end

  def dock(bike)
    raise "There is no space available!" if @bikes.count >= 20
    @bikes << bike
  end
  
  # def docked?
  #   @docked_bike
  # end
  
end