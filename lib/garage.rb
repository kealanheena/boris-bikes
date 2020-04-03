require_relative 'bike_container'

class Garage
  
  include BikeContainer

  def repair(bike)
    raise "This bike is already working" unless bike.broken?
    raise "This bike isn't in this garage" unless present?(bike)

    @bikes << bike
  end

end
