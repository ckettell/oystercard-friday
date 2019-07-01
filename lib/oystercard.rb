require 'pry'
class Oystercard
attr_reader :balance

MAXIMUM_VALUE = 90

  def initialize
    @balance = 0
  end
  def top_up(value)
    fail "Card balance cannot exceed £#{Oystercard::MAXIMUM_VALUE}" if @balance + value > MAXIMUM_VALUE
    @balance += value
  end

  #binding.pry
end
