require "./lib/bikes"

class DockingStation

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise "There is no bike available!" if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "There is no space available!" if full?
    @bikes << bike
  end

  private

  def full?
    true if @bikes.count >= @capacity
  end

  def empty?
    true if @bikes.count < 1
  end
  
  # def docked?
  #   @docked_bike
  # end
  
end