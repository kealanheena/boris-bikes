require "./lib/bikes"

class DockingStation
  def release_bike
    Bike.new
  end

  def dock(bike)
    @docked_bike = bike
  end

  # def docked?
  #   @docked_bike
  # end
  attr_reader :docked_bike
end

