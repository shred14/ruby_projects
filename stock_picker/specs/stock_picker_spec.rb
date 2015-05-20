require "../app/stock_picker"

RSpec.describe StockPicker do
  before(:all) do
      @object = Object.new
      @object.extend(StockPicker)
    end
  
  describe '#stock_picker' do

    it 'should return the example problem' do
      result = @object.pick([17,3,6,9,15,8,6,1,10])
      expect(result).to eq [1,4]
    end
  end
end
