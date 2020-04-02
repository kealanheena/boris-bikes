class Van

  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def station_collection(dockingstation)
    raise "There is no space available!" if full?

    dockingstation.bikes.each { |bike| 
      @bikes << dockingstation.bikes.delete(bike) if bike.broken? && !full?
    }
    @bikes
  end

  def garage_delivery(garage)
    raise "There's no bikes in this van" if empty?

    @bikes.each { |bike|
      garage.bikes << @bikes.delete(bike) if bike.broken? && !garage.full?
    }
    @bikes
  end

  private

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.count < 1
  end

end
