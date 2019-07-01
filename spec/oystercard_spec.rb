require 'oystercard'

describe Oystercard do
  it 'card has default balance of zero when initialized' do
    expect(subject.balance).to eq(0)
  end
  it 'tops up card balance' do
    subject.top_up(5.00)
    expect(subject.balance).to eq (5.00)
  end
end
