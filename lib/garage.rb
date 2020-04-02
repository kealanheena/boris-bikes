class Garage

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def repair(bike)
    raise "This bike is already working" unless bike.broken?
    raise "This bike isn't in this garage" unless present?(bike)

    @bikes << bike
  end

  private

  def full?

  end

  def present?(bike)
    @bikes.include?(bike)
  end

end
