require 'oystercard'

describe Oystercard do
  it 'card has default balance of zero when initialized' do
    expect(subject.balance).to eq(0)
  end
  it 'tops up card balance' do
    subject.top_up(5.00)
    expect(subject.balance).to eq (5.00)
  end
  it 'raises an error if card topped up over maximum value' do
    expect { subject.top_up(Oystercard::MAXIMUM_VALUE+1) }.to raise_error 'Exceeded maximum top-up value'
  end
  it 'checks if balance is over £90' do
    subject.top_up(Oystercard::MAXIMUM_VALUE+1)
    expect(subject.maximum_balance_exceeded?).to eq true
  end

end
