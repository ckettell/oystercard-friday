class Journey

  attr_reader :entry_station
  attr_reader :exit_station
  attr_reader :fare

  PENALTY_FARE = 6
  MINIMUM_VALUE = 1

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station = nil
    @fare = 0
  end

  def fare

    return MINIMUM_VALUE if self.complete?
    PENALTY_FARE

  end

  def finish(exit_station)
    @exit_station = exit_station
    self
  end

  def complete?
    return false if @entry_station.nil?
    return false if @exit_station.nil?
    true
  end


end

# journey = Journey.new("Aldgate")
#
# p journey.complete?
