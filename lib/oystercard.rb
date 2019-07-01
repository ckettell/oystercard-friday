require 'pry'
class Oystercard
attr_reader :balance
attr_reader :entry_station
attr_reader :list_of_journeys
attr_reader :exit_station

MAXIMUM_VALUE = 90
MINIMUM_VALUE = 1

  def initialize
    @balance = 0
    @list_of_journeys = []
  end

  def top_up(value)
    fail "Card balance cannot exceed £#{Oystercard::MAXIMUM_VALUE}" if @balance + value > MAXIMUM_VALUE
    @balance += value
  end

  def touch_in(entry_station)
    fail 'Balance below £1, please top up' if @balance < MINIMUM_VALUE
    @entry_station = true
  end

  def touch_out(exit_station)
    deduct(MINIMUM_VALUE)
    list_of_journeys << { entry_station: entry_station, exit_station: exit_station }
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

private

def deduct(fare)
  @balance -= fare
end


  # binding.pry
end
