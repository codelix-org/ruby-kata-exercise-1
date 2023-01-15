require_relative '../../lib/reorder_numbers/move_zeros'

RSpec.describe ReorderNumbers::MoveZeros do
  describe '.call' do
    context 'when given valid input' do
      it 'does not alter the array when the array is empty' do
        expect(described_class.call([])).to eq([])
      end

      it 'does not alter the array if no numbers are zero' do
        array = [1, 2, 3, 4, 5]

        expect(described_class.call(array)).to eq(array)
      end

      it 'does not alter the array if only contains zero' do
        array = [0, 0, 0, 0, 0, 0]

        expect(described_class.call(array)).to eq(array)
      end

      it 'moves the zero to the end when array contain one zero' do
        array = [1, 2, 0, 3, 4, 5]

        expect(described_class.call(array)).to eq([1, 2, 3, 4, 5, 0])
      end

      it 'moves all the zeros to the end when array contain multiple zero' do
        array = [1, 0, 2, 0, 3, 4, 0, 0]

        expect(described_class.call(array)).to eq([1, 2, 3, 4, 0, 0, 0, 0])
      end
    end

    context 'when the input is invalid' do
      it 'raises an invalid input error when the array contains non-numeric items in the array' do
        expect do
          described_class.call([1, "A", true, 0])
        end.to raise_error(described_class::InvalidInput)
      end

      ["I am a string input", :i_am_a_symbol_input, true, {}]. each do |input|
        it 'raises an invalid input error when the input is not an array' do
          expect do
            described_class.call(input)
          end.to raise_error(described_class::InvalidInput)
        end
      end
    end
  end
end
