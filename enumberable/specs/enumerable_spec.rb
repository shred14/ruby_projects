require "../app/enumerable"

RSpec.describe Enumerable do
  before(:all) do
      @object = [1,2,3]
      @target = 6
    end
  
  describe '#my_each' do

    it 'should actually work' do
      result = 0
      @object.my_each { |item| result += 2 }
      expect(result).to eq @target
    end
  end

  describe '#my_each_with_index' do

    it 'should actually work' do
      item_result = 0
      index_result = 0
      @object.my_each_with_index { |item,index| item_result += item; index_result += index }
      expect(index_result).to eq 3
      expect(item_result).to eq 6
    end
  end

  describe '#my_select' do
    it 'should actually work' do
      example = @object.select { |item| item <= 2 }
      result = @object.my_select { |item| item <= 2 }

      expect(example).to eq result
    end
  end

  describe '#my_all' do

    it 'should have the implicit block' do
      result = @object.my_all?
      expect(result).to be true
    end

    it 'should actually return a false' do
      result = @object.my_all? { |item| item < 3 }
      expect(result).to be false
    end

    it 'should actually return a true' do
      result = @object.my_all? { |item| item > 0 }
      expect(result).to be true
    end
  end

  describe '#my_any?' do
    it 'should have the implict block' do
      result = @object.my_any?
      expect(result).to eq true
    end

    it 'should actually return false' do
      result = @object.my_any? { |item| item < 0 }
      expect(result).to eq false
    end

    it 'should actually return true' do
      result = @object.my_any? { |item| item > 0 }
      expect(result).to eq true
    end
  end

  describe '#my_none?' do
    it 'should have an implict block' do
      result = @object.my_none?
      expect(result).to eq false
    end

    it 'should actually return false' do 
      result = @object.my_none? { |item| item > 2 }
      expect(result).to eq false
    end

    it 'should actually return true' do
      result = @object.my_none? { |item| item < 0 }
      expect(result).to eq true
    end
  end

  describe '#my_count' do
    it 'returns the lenght of the array when there is no argument or block' do
      result = @object.my_count
      expect(result).to eq 3
    end

    it 'returns the number of items that match if an argument is given' do
      result = @object.my_count(2)
      expect(result).to eq 1
    end
  end

  describe '#my_map' do
    it 'returns an enumerator when no block is given' do
      result = @object.my_map
      expect(result).to be_an Enumerator
    end

    it 'returns the altered array' do
      result = @object.my_map { |item| item * 2 }
      expect(result).to eq [2,4,6]
    end
  end

  describe '#my_inject' do

    it 'should call the method given in an argument' do
      result = @object.my_inject(initial = 0,sym = :+)
      expect(result).to eq 6
    end

    it 'should use default values given to it' do
      result = @object.my_inject(initial = 3, sym = :+)
      expect(result).to eq 9
    end

    it 'should use blocks' do
      result = @object.my_inject { |sum, n| sum + n }
      expect(result).to eq 6
    end
  end
end