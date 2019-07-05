require 'journey'

describe Journey do


  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:oystercard) { double :oystercard, balance: 10 }
  let(:subject) { described_class.new(entry_station)}

  it 'knows that a journey starts off incomplete' do
    expect(subject).not_to be_complete
  end

  it "knows when a journey is complete" do
    subject.finish(exit_station)
    expect(subject).to be_complete
  end

  it 'returns penalty fare if there was no entry station' do
    no_touch_in_journey = Journey.new(nil)
    expect(no_touch_in_journey.fare).to eq Journey::PENALTY_FARE
  end

  it 'returns penalty fare if no exit station' do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  it 'returns default fare if entry and exit station exist' do
    subject.finish(exit_station)
    expect(subject.fare).to eq Journey::MINIMUM_VALUE
  end

  it 'returns itself when exiting a journey' do
    expect(subject.finish(exit_station)).to eq subject
  end

end
