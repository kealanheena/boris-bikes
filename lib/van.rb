class Van
  def initialize
    @broken_bikes = []
  end

  def collect(container)
    container.bikes.each { |bike| 
      @broken_bikes << container.bikes.delete(bike) if bike.broken? == true
    }
    @broken_bikes
  end

  def deliver(container)
    @broken_bikes.each { |bike|
      container.bikes << @broken_bikes.delete(bike) if bike.broken? == true
    }
  end
end
