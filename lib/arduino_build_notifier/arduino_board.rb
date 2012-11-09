require 'dino'

module ArduinoBuildNotifier
  class ArduinoBoard
    def initialize
      @board        = Dino::Board.new(Dino::TxRx.new)
      @success_led  = Dino::Components::Led.new(pin: 13, board: @board)
      @failure_led  = Dino::Components::Led.new(pin: 12, board: @board)
      @building_led = Dino::Components::Led.new(pin: 11, board: @board)
      @error_led    = Dino::Components::Led.new(pin: 10, board: @board)
      @leds         = [@success_led, @failure_led, @building_led, @error_led]
    end

    def success
      turn_off_leds
      @success_led.on
    end

    def failure
      turn_off_leds
      @failure_led.on
    end

    def building
      turn_off_leds
      @building_led.on
    end

    def error
      turn_off_leds
      @error_led.on
    end

    private

    def turn_off_leds
      @leds.each { |led| led.off }
    end

  end
end
