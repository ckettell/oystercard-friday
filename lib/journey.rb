class Journey

  attr_reader :entry_station
  attr_reader :list_of_journeys
  attr_reader :exit_station
  attr_reader :balance
  attr_reader :fare

  PENALTY_FARE = 6

  def initialize(oystercard = Oystercard.new)
    @oystercard = oystercard
    @list_of_journeys = []
    @entry_station = nil
    @fare = 0
  end

  def fare
    if @entry_station != nil
      @fare = Oystercard::MINIMUM_VALUE
    else
      @fare = PENALTY_FARE
    end
    @fare
  end

  def in_journey?
    !!entry_station
  end


end
