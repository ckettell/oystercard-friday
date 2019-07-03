class JourneyLog
  attr_reader :journey_class
  attr_reader :current_journey

  def initialize(journey_class = Journey.new)
    @journey_class = journey_class
    @in_journey = false
    @journey_log = []
    @current_journey = []
  end

  def start(entry_station)
    @in_journey = true
    @current_journey << {entry_station: entry_station}

  end

  def finish(exit_station)
    @in_journey = false
    @current_journey << {exit_station: exit_station}
    @journey_log << @current_journey
    @current_journey = []

  end

  def in_journey?
    @in_journey
  end

  def journeys
    @journey_log.each do |journey|
      return "Entry Station: #{@journey_log[:entry_station]}, Exit Station: #{@journey_log[:exit_station]}"
    end

  end

  def current_journey
    @current_journey
  end

end
