require "../app/substring"

RSpec.describe Substring do
  before(:all) do
      @object = Object.new
      @object.extend(Substring)
      @dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    end
  
  describe '#magic' do

    it 'should actually work' do
      result = @object.magic("below", @dictionary)
      expect(result).to eq ({ "below" => 1, "low" => 1 })
    end

    it 'should handle multiple words' do
      result = @object.magic("Howdy partner, sit down! How's it going?", @dictionary)
      expect(result).to eq ({ "down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,
        "partner"=>1,"sit"=>1 })
    end
  end
end
