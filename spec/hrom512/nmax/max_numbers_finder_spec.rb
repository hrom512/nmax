require 'spec_helper'

describe Hrom512::Nmax::MaxNumbersFinder do
  let(:input_stream) { double('input_stream') }
  let(:numbers_count) { 3 }

  let(:numbers_finder) { described_class.new(input_stream, numbers_count) }
  let(:numbers_parser) { double('numbers_parser') }

  before do
    allow(Hrom512::Nmax::NumbersParser).to receive(:new).with(input_stream).and_return(numbers_parser)
    allow(numbers_parser).to receive(:next_number).and_return(23, 145, 56, 1002, 345, 777, nil)
  end

  subject { numbers_finder.find }

  it 'calculate max numbers' do
    is_expected.to eq([1002, 777, 345])
  end
end
