require "../app/encrypt"

RSpec.describe Encrypt do
  
  
  describe 'encode' do
    before(:all) do
      @object = Object.new
      @object.extend(Encrypt)
    end

    it 'returns f when given a and 5' do
      result = @object.encode('a', 5)
      expect(result).to eq 'f'
    end

    it 'returns B when given W and 5' do
      result = @object.encode('W', 5)
      expect(result).to eq 'B'
    end

    it "returns  \"Bmfy f xywnsl!\" when given \"What a string!\" and 5" do
      result = @object.encode('What a string!', 5)
      expect(result).to eq "Bmfy f xywnsl!"
    end
  end

  # describe "when encode is given (\"What a string!\", 5)" do
  #   before(:all) do
  #     @object = Object.new
  #     @object.extend(Encrypt)
  #     @result = @object.encode('What a string!', 5)
  #   end



  #   it "returns  \"Bmfy f xywnsl!\"" do
  #     expect(@result).to eq "Bmfy f xywnsl!"
  #   end
  # end
end
