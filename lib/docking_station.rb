require "./lib/bikes"
require_relative 'bike_container'

class DockingStation
  
  include BikeContainer

  def release_bike
    raise "There is no bike available!" if empty?
    raise 'This bike is broken' if @bikes.last.broken?
    
    @bikes.pop
  end

  def dock(bike)
    raise "There is no space available!" if full?

    @bikes << bike
  end

end
