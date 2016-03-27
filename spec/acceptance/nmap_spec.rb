require 'spec_helper'

describe 'nmap', type: :acceptance do
  before { skip }

  context 'without args' do
    subject { call_nmap }

    it { is_expected.to eq('Param is required') }
  end

  context 'with two args' do
    subject { call_nmap('10 20') }

    it { is_expected.to eq('Error parameters count') }
  end

  context 'with one arg' do
    subject { call_nmap('10') }

    it { is_expected.to be_blank }

    context 'with input stream' do
      let(:file) { generate_file('data_1GB.txt', 1024, numbers) }
      let(:numbers) { (1..100_000).to_a }
      let(:nmap_param) { 10_000 }
      let(:max_numbers) { numbers.reverse[0..nmap_param - 1] }

      subject { call_nmap(nmap_param, input_file: file) }

      it { is_expected.to eq(max_numbers.join("\n")) }
    end
  end
end
