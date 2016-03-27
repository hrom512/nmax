require 'spec_helper'

describe 'nmax', type: :acceptance do
  let(:usage) { "Usage: cat FILE | nmax NUMBERS_COUNT\n" }

  context 'without args' do
    subject { call_nmax }

    it { is_expected.to eq(usage) }
  end

  context 'with two args' do
    subject { call_nmax('10 20') }

    it { is_expected.to eq(usage) }
  end

  context 'with one arg and input stream' do
    let(:file) { generate_file('data_100MB.txt', 100, numbers) }
    let(:numbers) { (1..10_000).to_a }
    let(:nmax_param) { 100 }
    let(:max_numbers) { (9901..10_000).to_a.reverse }

    subject { call_nmax(nmax_param, input_file: file) }

    it 'return max numbers' do
      is_expected.to eq("#{max_numbers.join("\n")}\n")
    end
  end
end
