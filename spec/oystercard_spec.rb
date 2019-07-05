require 'oystercard'

describe Oystercard do

  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  it 'card has default balance of zero when initialized' do
    expect(subject.balance).to eq(0)
  end

  context 'Setting topup to £10' do
    before do
      subject.top_up(10)
    end

    it 'Card creates new journey and saves when touched in' do
      subject.touch_in(entry_station)
      expect(subject.current_journey).to be_a Journey
    end

    it 'card is not in journey if touched out' do
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.current_journey).to eq nil
    end



    it 'minuses fare from the Oystercard' do

      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.balance).to be 9
    end
  end

    it 'raises an error if balance is below £1' do
      expect { subject.touch_in(entry_station) }.to raise_error "Balance below £1, please top up"
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
