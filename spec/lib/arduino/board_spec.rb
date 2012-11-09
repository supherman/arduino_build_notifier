require 'spec_helper'

describe ArduinoBuildNotifier::Arduino::Board do
  let(:success)  { stub }
  let(:failure)  { stub }
  let(:building) { stub }
  let(:error)    { stub }

  subject do
    ArduinoBuildNotifier::Arduino::Board.new success, failure, building, error
  end

  describe '#success' do
    before do
      subject.should_receive(:turn_off_indicators)
      success.should_receive :on
    end

    it 'turns on success led' do
      subject.success
    end
  end

  describe '#failure' do
    before do
      subject.should_receive(:turn_off_indicators)
      failure.should_receive :on
    end

    it 'turns on failure led' do
      subject.failure
    end
  end

  describe '#building' do
    before do
      subject.should_receive(:turn_off_indicators)
      building.should_receive :on
    end

    it 'turns on building led' do
      subject.building
    end
  end


  describe '#error' do
    before do
      subject.should_receive(:turn_off_indicators)
      error.should_receive :on
    end

    it 'turns on error led' do
      subject.error
    end
  end

  describe '#turn_off_indicators' do
    it 'turns off all indicators' do
      success.should_receive :off
      failure.should_receive :off
      building.should_receive :off
      error.should_receive :off
      subject.send :turn_off_indicators
    end
  end

end
