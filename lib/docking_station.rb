require "./lib/bikes"

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "There is no bike available!" if self.empty?
    @bikes.pop
  end

  def dock(bike)
    raise "There is no space available!" if self.full?
    @bikes << bike
  end

  private

  def full?
    true if @bikes.count >= 20
  end

  def empty?
    true if @bikes.count < 1
  end
  
  # def docked?
  #   @docked_bike
  # end
  
end