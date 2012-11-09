require 'spec_helper'

describe ArduinoBuildNotifier::ArduinoBoard do
  let(:txrx)     { stub }
  let(:board)    { stub }
  let(:success)  { stub }
  let(:failure)  { stub }
  let(:building) { stub }
  let(:error)    { stub }

  before do
    Dino::TxRx.should_receive(:new).and_return txrx
    Dino::Board.should_receive(:new).with(txrx).and_return board
    Dino::Components::Led.should_receive(:new).with(pin: 13, board: board).and_return success
    Dino::Components::Led.should_receive(:new).with(pin: 12, board: board).and_return failure
    Dino::Components::Led.should_receive(:new).with(pin: 11, board: board).and_return building
    Dino::Components::Led.should_receive(:new).with(pin: 10, board: board).and_return error
  end

  describe '#success' do
    before do
      subject.should_receive(:turn_off_leds)
      success.should_receive :on
    end

    it 'turns on success led' do
      subject.success
    end
  end

  describe '#failure' do
    before do
      subject.should_receive(:turn_off_leds)
      failure.should_receive :on
    end

    it 'turns on failure led' do
      subject.failure
    end
  end

  describe '#building' do
    before do
      subject.should_receive(:turn_off_leds)
      building.should_receive :on
    end

    it 'turns on building led' do
      subject.building
    end
  end


  describe '#error' do
    before do
      subject.should_receive(:turn_off_leds)
      error.should_receive :on
    end

    it 'turns on error led' do
      subject.error
    end
  end

  describe '#turn_off_leds' do
    it 'turns off all the leds' do
      success.should_receive :off
      failure.should_receive :off
      building.should_receive :off
      error.should_receive :off
      subject.send :turn_off_leds
    end
  end

end
