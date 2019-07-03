class JourneyLog
  attr_reader :journey_class
  attr_reader :current_journey
  
  def initialize(journey_class = Journey.new)
    @journey_class = journey_class
    @in_journey = false
    @current_journey = []
  end

  def start(entry_station)
    in_journey?
    @current_journey << {entry_station: entry_station}
  end

  def in_journey?
    @in_journey = true
  end



end
