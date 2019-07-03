class Journey

  attr_reader :entry_station
  attr_reader :list_of_journeys
  attr_reader :exit_station
  attr_reader :balance

  PENALTY_FARE = 6

  def initialize(oystercard = Oystercard.new)
    @oystercard = oystercard
    @list_of_journeys = []
    @entry_station = nil
    @fare = 0
  end

  def touch_in(entry_station, oystercard)
    fail 'Balance below £1, please top up' if oystercard.balance < Oystercard::MINIMUM_VALUE
    @entry_station = entry_station
  end

  def touch_out(exit_station, oystercard)
    @oystercard.deduct(Oystercard::MINIMUM_VALUE)
    @list_of_journeys << { entry_station: entry_station, exit_station: exit_station }
    @entry_station = nil
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
