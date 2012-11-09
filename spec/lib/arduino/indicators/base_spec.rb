require 'spec_helper'

describe ArduinoBuildNotifier::Arduino::Indicators::Base do
  let(:board) { stub }
  let(:led)   { stub }

  before do
    Dino::Components::Led.should_receive(:new).with(pin: 1, board: board).and_return led
  end

  subject { ArduinoBuildNotifier::Arduino::Indicators::Base.new board, 1 }

  describe '#on' do
    it 'Turns on the led' do
      led.should_receive :on
      subject.on
    end
  end

  describe '#off' do
    it 'Turns off the led' do
      led.should_receive :off
      subject.off
    end
  end
end
