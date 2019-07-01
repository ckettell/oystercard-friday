require 'oystercard'

describe Oystercard do
  it 'card has default balance of zero when initialized' do
    expect(subject.balance).to eq(0)
  end
  it 'tops up card balance' do
    subject.top_up(5)
    expect(subject.balance).to eq (5)
  end
  it 'raises an error if card topped up over maximum value' do
    subject.top_up(Oystercard::MAXIMUM_VALUE)
    expect { subject.top_up(1) }.to raise_error "Card balance cannot exceed £#{Oystercard::MAXIMUM_VALUE}"
  end


end
