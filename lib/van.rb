class Van

  attr_reader :capacity, :bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def station_collection(dockingstation) 
    raise "There is no bikes to collect!" if dockingstation.empty?
    raise "There is no space available!" if full?

    dockingstation.bikes.each { |bike| 
      @bikes << dockingstation.bikes.delete(bike) if bike.broken? && !full?
    }
    @bikes
  end

  def garage_collection(garage)
    raise "There is no bikes to collect!" if garage.empty?
    raise "There is no space available!" if full? 

    garage.bikes.each { |bike| 
      @bikes << garage.bikes.delete(bike) unless bike.broken?
    }
    @bikes
  end

  def garage_delivery(garage)
    raise "There's no bikes in this van" if empty?
    raise "There is no space available!" if garage.full?

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
