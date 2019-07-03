require 'oystercard'

describe Oystercard do

  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
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

  it 'deducts the minimum fare from balance when you touch out' do
    journey = Journey.new
    subject.top_up(10)
    oystercard = Oystercard.new
    p subject
    journey.touch_in(entry_station, oystercard)
    p expect { journey.touch_out(exit_station, oystercard) }.to change {oystercard.balance}.by(-1)
  end


end
