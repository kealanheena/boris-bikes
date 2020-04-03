module BikeContainer

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  private

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.count < 1
  end

  def present?(bike)
    @bikes.include?(bike)
  end


end