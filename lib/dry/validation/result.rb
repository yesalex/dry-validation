module Dry
  module Validation
    def self.Result(input, value, predicate)
      Result.new(input, value, predicate)
    end

    class Result
      attr_reader :input, :value, :predicate

      def initialize(input, value, predicate)
        @input = input
        @value = value
        @predicate = predicate
      end

      def to_ary
        [:input, input, [:predicate, predicate]]
      end
      alias_method :to_a, :to_ary

      def and(other)
        if success?
          other.(input)
        else
          self
        end
      end
      alias_method :&, :and

      def success?
        @value
      end

      def failure?
        ! success?
      end
    end
  end
end
