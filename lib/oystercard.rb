require 'pry'
class Oystercard
attr_reader :balance
attr_accessor :in_journey

MAXIMUM_VALUE = 90
MINIMUM_VALUE = 1

  def initialize
    @balance = 0
  end

  def top_up(value)
    fail "Card balance cannot exceed £#{Oystercard::MAXIMUM_VALUE}" if @balance + value > MAXIMUM_VALUE
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    fail 'Balance below £1, please top up' if @balance < MINIMUM_VALUE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  #binding.pry
end
