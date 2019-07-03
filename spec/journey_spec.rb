require 'journey'

describe Journey do

  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:oystercard) { double :oystercard, balance: 10 }

  it 'card is in journey if it is touched in' do
    subject.touch_in(entry_station, oystercard)
    expect(subject.in_journey?).to eq true
  end

  it 'card is not in journey if touched out' do
    subject.touch_in(entry_station, oystercard)
    subject.touch_out(exit_station, oystercard)
    expect(subject.in_journey?).to eq false
  end

  it 'raises an error if balance is below £1' do
    oystercard = double :oystercard, balance: 0
    expect { subject.touch_in(entry_station, oystercard) }.to raise_error "Balance below £1, please top up"
  end

  it 'card has empty list of journeys by default' do
    expect(subject.list_of_journeys).to be_empty
  end

  it 'touching in and out creates one journey' do
    subject.touch_in(entry_station, oystercard)
    subject.touch_out(exit_station, oystercard)
    expect(subject.list_of_journeys.length).to eq Oystercard::MINIMUM_VALUE
  end

  it 'returns penalty fare if there was no entry station' do
    subject.entry_station
    subject.fare
    expect(subject.fare).to eq 6
  end

  it 'return minimum fare if the entry station is given' do
    subject.touch_in(entry_station, oystercard)
    expect(subject.fare).to eq Oystercard::MINIMUM_VALUE
  end

end
