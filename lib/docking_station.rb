require "./lib/bikes"

class DockingStation

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise "There is no bike available!" if empty?
    raise 'This bike is broken' if @bikes.last.broken?
    
    @bikes.pop
  end

  def dock(bike)
    raise "There is no space available!" if full?

    @bikes << bike
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.count < 1
  end
  
end
