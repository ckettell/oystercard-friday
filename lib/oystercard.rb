class Oystercard
attr_reader :balance

MAXIMUM_VALUE = 90.00

  def initialize
    @balance = 0
  end
  def top_up(value)
    @balance += value
    raise 'Exceeded maximum top-up value' if maximum_balance_exceeded?
  end
  def maximum_balance_exceeded?
    @balance > MAXIMUM_VALUE
  end

end
