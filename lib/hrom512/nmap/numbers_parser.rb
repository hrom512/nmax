module Hrom512
  module Nmap
    # Parse numbers from input stream
    class NumbersParser
      BLOCK_SIZE = 100_000

      def initialize(input_stream)
        @input_stream = input_stream

        @numbers = []

        @prev_tail = nil
        @is_last_block = false
      end

      # Get next number from stream
      # Return number or nil
      def next_number
        process_next_block if @numbers.empty?

        @numbers.shift
      end

      private

      # Get next block from stream, parse numbers
      def process_next_block
        data = read_data
        return if data.nil?

        @numbers = parse_numbers(data)
        process_next_block if @numbers.empty?
      end

      # Read data from stream
      def read_data
        return if @is_last_block

        data = @input_stream.read(BLOCK_SIZE)
        @is_last_block = true if data.nil?

        # add prev tail if exists
        if @prev_tail
          data = "#{@prev_tail}#{data}"
          @prev_tail = nil
        end

        data
      end

      # Parse numbers from string data
      def parse_numbers(data)
        numbers = data.scan(/\d{1,1000}/m).map(&:to_i)

        # extract last number if data ends with digit
        # rubocop:disable Style/IfUnlessModifier
        if !@is_last_block && data[-1] =~ /\d/
          @prev_tail = numbers.pop
        end

        numbers
      end
    end
  end
end
