require "../app/bubble_sort"

RSpec.describe BubbleSort do
  before(:all) do
      @sorter = Object.new
      @sorter.extend(BubbleSort)
      @target = (1..9).to_a
      @numbers = @target.reverse
    end
  
  describe '#sort' do

    it 'should not alter the original' do
      temp = @numbers.dup
      @sorter.sort @numbers
      expect(temp).to eq @numbers
    end

    it 'should run correctly' do
      result = @sorter.sort(@numbers)
      expect(result).to eq (@target)
    end
  end

  describe '#sort_by' do

    it 'can handle empty arrays' do
      @sorter.sort_by([]) { |left,right| right <=> left }
    end

    it 'should not alter the original' do
      temp = @numbers.dup
      @sorter.sort_by(@numbers) { |left,right| right <=> left }
      expect(temp).to eq @numbers
    end

    it 'should run correctly' do
      result = @sorter.sort_by(@numbers) { |left,right| right <=> left }
      expect(result).to eq (@target)

      result = @sorter.sort_by(@numbers) { |left,right| left <=> right }
      expect(result).to eq (@numbers)
    end
  end
end