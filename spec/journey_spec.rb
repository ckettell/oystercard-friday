require 'journey'

describe Journey do

  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:oystercard) { double :oystercard, balance: 10 }


  it 'card has empty list of journeys by default' do
    expect(subject.list_of_journeys).to be_empty
  end


  it 'returns penalty fare if there was no entry station' do
    subject.entry_station
    subject.fare
    expect(subject.fare).to eq 6
  end


end
