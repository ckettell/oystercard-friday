require 'pry'

require_relative './station'
require_relative './journey_log'
require_relative './journey'

class Oystercard
attr_reader :current_journey, :balance

MAXIMUM_VALUE = 90
MINIMUM_VALUE = 1

  def initialize
    @balance = 0
    @current_journey = nil
  end

  def top_up(value)
    fail "Card balance cannot exceed £#{Oystercard::MAXIMUM_VALUE}" if @balance + value > MAXIMUM_VALUE
    @balance += value
  end

  def touch_in(entry_station)
    @current_journey = Journey.new(entry_station)
    fail 'Balance below £1, please top up' if @balance < MINIMUM_VALUE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    self.deduct(MINIMUM_VALUE)
    @current_journey = nil
  end
# private

def deduct(fare)
  @balance -= fare
end


  # binding.pry
end
