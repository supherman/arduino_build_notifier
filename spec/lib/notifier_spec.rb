require 'spec_helper'

describe ArduinoBuildNotifier::Notifier do
  let(:build) { stub }
  let(:board) { stub }

  subject { ArduinoBuildNotifier::Notifier.new build, board }

  describe '#notify' do
    it 'prints the build status' do
      board.should_receive(:status)
      subject.notify(:status)
    end
  end

  describe '#start_notifications' do
    it 'request for the build status each given time' do
      # TODO: Find a way to test celluloid methods
    end
  end
end
