require 'rspec'
require_relative './../robot_cleaner'

RSpec.describe RobotCleaner do
  let(:robot_cleaner) { described_class.new(grid, *cordinates) }
  subject(:perform) { robot_cleaner.perform }

  let(:grid) { '5x5' }
  let(:cordinates) { ['(1,2)'] }

  describe '#perform' do
    context 'when arguments are not valid' do
      context 'when grid is not present' do
        let(:grid) { nil }

        it { is_expected.to be(false) }
      end

      context 'when cordinates are not present' do
        let(:cordinates) { [] }

        it { is_expected.to be(false) }
      end

      context 'when cordinates and arguments are not present' do
        let(:cordinates) { [] }
        let(:grid) { nil }

        it { is_expected.to be(false) }

        it 'verifies the error messages' do
          perform
          expect(robot_cleaner.errors[0]).to eql('Invalid Grid Details')
          expect(robot_cleaner.errors[1]).to eql('Coordinates cannot be blank')
        end
      end

      context 'when invalid cordinates are passed' do
        let(:cordinates) { ['(10,12)'] }

        it { is_expected.to be_empty }
      end
    end

    context 'when arguments are valid' do
      context 'when one cordinates is passed' do
        let(:cordinates) { ['(1,3)'] }

        it { is_expected.to eql('ENNNC') }
      end

      context 'when more cordinates are passed' do
        let(:cordinates) { ['(1,3)', '(4,4)'] }

        it { is_expected.to eql('ENNNCEEENC') }
      end

      context 'when more cordinates are passed' do
        let(:cordinates) { ['(1,3)', '(4,4)', '(1,1)'] }

        it { is_expected.to eql('ENNNCEEENCWWWSSSC') }
      end
    end
  end
end
