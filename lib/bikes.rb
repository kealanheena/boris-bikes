class Bike
  def working?
    true
  end

  def broken?
    @broken
  end

  def report
    @broken = true
  end

  def repair
    @broken = false
  end
end
