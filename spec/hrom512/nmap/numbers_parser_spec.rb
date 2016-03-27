require 'spec_helper'
require 'stringio'

describe Hrom512::Nmap::NumbersParser do
  let(:input_data) { '1 test -22 test333test 04444.55555' }
  let(:input_stream) { StringIO.new(input_data) }
  let(:parser) { described_class.new(input_stream) }

  describe '#next_number' do
    it 'return numbers from input stream' do
      expect(parser.next_number).to eq(1)
      expect(parser.next_number).to eq(22)
      expect(parser.next_number).to eq(333)
      expect(parser.next_number).to eq(4444)
      expect(parser.next_number).to eq(55555)
      expect(parser.next_number).to be_nil
    end
  end
end
