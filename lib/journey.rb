class Journey

  attr_reader :entry_station
  attr_reader :list_of_journeys
  attr_reader :exit_station
  attr_reader :balance

  def initialize(oystercard = Oystercard.new)
    @oystercard = oystercard
    @list_of_journeys = []
  end

  def touch_in(entry_station, oystercard)
    fail 'Balance below £1, please top up' if oystercard.balance < Oystercard::MINIMUM_VALUE
    @entry_station = true
  end

  def touch_out(exit_station, oystercard)
    p @oystercard.balance
    @oystercard.deduct(Oystercard::MINIMUM_VALUE)
    p @balance
    @list_of_journeys << { entry_station: entry_station, exit_station: exit_station }
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end


end
