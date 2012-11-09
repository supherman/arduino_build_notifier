require 'spec_helper'

describe ArduinoBuildNotifier::CruiseControlBuild do
  let(:url)      { 'foo url' }
  let(:project)  { 'foo' }
  let(:auth)     { stub }
  let(:response) { stub }

  subject { ArduinoBuildNotifier::CruiseControlBuild.new url,project, auth }

  describe '#request_status' do
    before do
      HTTParty.should_receive(:get).with("#{url}/XmlStatusReport.aspx", basic_auth: auth).and_return response
      subject.should_receive(:parse).with(response).and_return response
      subject.should_receive(:set_status).with(response)
    end

    it 'request for a build status' do
      subject.request_status
    end
  end

  describe '#set_status' do
    context 'When building' do
      let(:response) { { activity: 'Building' } }

      it 'returns :building' do
        subject.send(:set_status, response).should eq(:building)
      end
    end

    context 'When build finished' do
      let(:response) { { activity: 'Waiting', lastBuildStatus: :success } }

      it 'returns the build result' do
        subject.send(:set_status, response).should eq(:success)
      end
    end
  end

end

