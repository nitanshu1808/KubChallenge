require 'rspec'
require_relative './../utility_helper'

RSpec.describe UtilityHelper do
  let(:dummy_class) { Class.new { include UtilityHelper } }

  let(:instance) { dummy_class.new }

  context '#transform_str_into_arr_of_int' do
    subject { instance.transform_str_into_arr_of_int(val) }

    shared_examples 'transform string into array of integers' do |param_one, param_two|
      let(:val) { param_one }
      let(:expected_outcome) { param_two }

      it { is_expected.to eql(expected_outcome) }
    end

    context 'when argument is invalid' do
      context 'when argument is nil' do
        include_examples 'transform string into array of integers', nil, nil
      end

      context 'when argument is empty string' do
        include_examples 'transform string into array of integers', '', []
      end
    end

    context 'when argument is valid' do
      context 'when argument is grid' do
        include_examples 'transform string into array of integers', '3X3', [3,3]
      end

      context 'when argument is co_ordinates' do
        include_examples 'transform string into array of integers', '(2,3)', [2,3]
      end
    end
  end

  context '#direction_values' do
    subject { instance.direction_values(val) }

    context 'when argument vertical is true' do
      let(:val) { true }

      it { is_expected.to eql(%w[N S]) }
    end

    context 'when argument vertical is false' do
      let(:val) { false }

      it { is_expected.to eql(%w[E W]) }
    end
  end

  context 'when verifying value for constant DIRECTIONS' do
    subject { UtilityHelper::DIRECTIONS }
    let(:expected_val) do
      {
        north: 'N',
        south: 'S',
        east: 'E',
        west: 'W',
      }
    end

    it { is_expected.to eql(expected_val) }
  end
end
