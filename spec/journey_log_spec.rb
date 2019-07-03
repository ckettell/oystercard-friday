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

  # describe '#current_journey' do
  #   it ''
  # end

  describe '#finish' do
    it 'ends a journey with an exit station' do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.in_journey?).to eq false
    end
  end

end
