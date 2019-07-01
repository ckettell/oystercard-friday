require 'oystercard'

describe Oystercard do
  subject = Oystercard.new
  it 'card has default balance of zero when initialized' do
    expect(subject.balance).to eq(0)
  end
end
