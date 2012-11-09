require 'httparty'
require 'nokogiri'

module ArduinoBuildNotifier
  class CruiseControlBuild
    attr_reader :status

    def initialize(url, project, auth = {})
      @url     = "#{url}/XmlStatusReport.aspx"
      @project = project
      @auth    = auth
    end

    def request_status
      begin
        response = HTTParty.get @url, basic_auth: @auth
        response = parse(response)
        set_status(response)
      rescue
        @status = :error
      end
    end

    private

    def parse(response)
      @response = Nokogiri.XML(response).
        xpath(%(//Projects/Project[@name="#{@project}"])).first
    end

    def set_status(response)
      @status = if response[:activity] == 'Building'
                  :building
                else
                  response[:lastBuildStatus].downcase.to_sym
                end
    end

  end
end

