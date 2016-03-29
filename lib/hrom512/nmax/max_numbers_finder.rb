module Hrom512
  module Nmax
    # Find N maximum numbers in input stream
    class MaxNumbersFinder
      MAX_STORE_ELEMENTS = 1_000_000

      def initialize(input_stream, numbers_count)
        @input_stream = input_stream
        @numbers_count = numbers_count
      end

      def find
        numbers_parser = NumbersParser.new(@input_stream)
        numbers = []

        while (number = numbers_parser.next_number)
          numbers << number
          numbers = max_elements(numbers) if numbers.size > MAX_STORE_ELEMENTS
        end

        max_elements(numbers)
      end

      private

      def max_elements(numbers)
        numbers.uniq.sort.reverse[0..(@numbers_count - 1)]
      end
    end
  end
end
