class Van

  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def collect(container)
    raise "There is no space available!" if @bikes.length >= DEFAULT_CAPACITY
    container.bikes.each { |bike| 
      @bikes << container.bikes.delete(bike) if bike.broken?
    }
    @bikes
  end

  # def deliver(container)
  #   @broken_bikes.each { |bike|
  #     container.bikes << @broken_bikes.delete(bike) if bike.broken? == true
  #   }
  # end
end
