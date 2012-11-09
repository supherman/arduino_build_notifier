module ArduinoBuildNotifier
  module Arduino
    class Board
      def initialize(success, failure, building, error)
        @indicators = {}
        @indicators[:success]  = success
        @indicators[:failure]  = failure
        @indicators[:building] = building
        @indicators[:error]    = error
      end

      def success
        turn_off_indicators
        @indicators[:success].on
      end

      def failure
        turn_off_indicators
        @indicators[:failure].on
      end

      def building
        turn_off_indicators
        @indicators[:building].on
      end

      def error
        turn_off_indicators
        @indicators[:error].on
      end

      private

      def turn_off_indicators
        @indicators.each { |key, indicator| indicator.off }
      end

    end
  end
end
