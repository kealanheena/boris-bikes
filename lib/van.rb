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
      @bikes << dockingstation.bikes.delete(bike) if bike.broken?
    }
    @bikes
  end

  # def deliver(container)
  #   @broken_bikes.each { |bike|
  #     container.bikes << @broken_bikes.delete(bike) if bike.broken? == true
  #   }
  # end

  private

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.count < 1
  end

end
