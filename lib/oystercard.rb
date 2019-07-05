require 'pry'

require_relative './station'
require_relative './journey_log'
require_relative './journey'

class Oystercard
attr_reader :current_journey, :balance

MAXIMUM_VALUE = 90


  def initialize
    @balance = 0
    @current_journey = nil
    # @journey_log = JourneyLog.new
  end

  def top_up(value)
    fail "Card balance cannot exceed £#{Oystercard::MAXIMUM_VALUE}" if @balance + value > MAXIMUM_VALUE
    @balance += value
  end

  def touch_in(entry_station, journey = Journey)
    @current_journey = journey.new(entry_station)
    fail 'Balance below £1, please top up' if @balance < Journey::MINIMUM_VALUE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    @current_journey.finish(exit_station)
    self.deduct(@current_journey.fare)
    @current_journey = nil
  end
# private

def deduct(fare)
  @balance -= fare
end


  # binding.pry
end
