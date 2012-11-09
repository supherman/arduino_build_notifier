require 'celluloid'

module ArduinoBuildNotifier
  module Arduino
    module Indicators
      class Building < Base
        include Celluloid

        def on
          @timer = every 1 do
            @led.on
            sleep 0.5
            @led.off
          end
        end

        def off
          @led.off
          @timer.cancel if @timer
        end
      end
    end
  end
end
