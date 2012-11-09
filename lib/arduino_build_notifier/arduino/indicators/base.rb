require 'dino'

module ArduinoBuildNotifier
  module Arduino
    module Indicators
      class Base
        def initialize(board, pin)
          @board = board
          @pin   = pin
          @led   = Dino::Components::Led.new pin: pin, board: board
        end

        def on
          @led.on
        end

        def off
          @led.off
        end
      end
    end
  end
end
