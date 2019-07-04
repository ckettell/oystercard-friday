require 'journey_log'
describe JourneyLog do
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  # describe '#initialize' do
  #   it 'creates a journey class when new journey log is instantiated' do
  #     expect(subject.journey_class).to eq !nil
  #   end
  # end
  describe '#start' do
    it 'starts a new journey with an entry station' do
      subject.start(entry_station)
      expect(subject.in_journey?).to eq true
    end
    it 'current journey has a length of 1 when journey starts' do
      subject.start(entry_station)
      # expect(subject.current_journey[0]).to eq entry_station
      expect(subject.current_journey[0]).to include(:entry_station => entry_station)
    end
  end

  describe '#current_journey' do
    it 'returns an incomplete journey or creates a new journey' do
      subject.start(entry_station)
      expect(subject.current_journey.length).to eq 1
    end

  end

  describe '#finish' do
    it 'ends a journey with an exit station' do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.in_journey?).to eq false
    end
    it 'adds an exit station to current journey' do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.current_journey[1]).to include(:exit_station => exit_station)
    end
  end

  describe '#journeys' do
    it 'prints a list of previous journeys' do
      subject.start(entry_station)
      subject.finish(exit_station)
      subject.start(entry_station)
      subject.finish(exit_station)
      p subject.journey_log
      expect(subject.journeys).to eq 'Entry Station: entry_station, Exit Station: exit_station \n Entry Station: entry_station, Exit Station: exit_station'
    end
  end


end
