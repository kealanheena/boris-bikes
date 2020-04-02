class Garage

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def repair(bike)
    raise "This bike is already working" unless bike.broken?
    raise "This bike isn't in this garage" unless present?(bike)

    @bikes << bike
  end

  private

  def present?(bike)
    @bikes.include?(bike)
  end
end
