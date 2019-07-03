require 'pry'
class Oystercard
attr_accessor :balance
attr_reader :entry_station
attr_reader :list_of_journeys
attr_reader :exit_station

MAXIMUM_VALUE = 90
MINIMUM_VALUE = 1

  def initialize
    @balance = 0
  end

  def top_up(value)
    fail "Card balance cannot exceed £#{Oystercard::MAXIMUM_VALUE}" if @balance + value > MAXIMUM_VALUE
    @balance += value
  end


# private

def deduct(fare)
  @balance -= fare
end


  # binding.pry
end
