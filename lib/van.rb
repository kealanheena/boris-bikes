class Van
  def initialize
    @broken_bikes = []
  end

  def collect(container)
    container.bikes.each { |bike| 
      @broken_bikes << bike if bike.broken? == true
    }
    @broken_bikes
  end
end
