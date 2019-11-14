require "./lib/bikes"

class DockingStation
  def release_bike
    raise "There is no bike available!" if !@docked_bike
    @docked_bike
  end

  def dock(bike)
    @docked_bike = bike
  end

  attr_reader :docked_bike
  # def docked?
  #   @docked_bike
  # end
  
end

