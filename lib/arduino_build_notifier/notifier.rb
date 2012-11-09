require 'celluloid'

module ArduinoBuildNotifier
  class Notifier
    include Celluloid

    def initialize(build, arduino, time = 10)
      @time    = time
      @build   = build
      @arduino = arduino
    end

    def notify(status)
      @arduino.send status
    end

    def start_notifications
      every @time do
        notify @build.request_status
      end
    end
  end
end
