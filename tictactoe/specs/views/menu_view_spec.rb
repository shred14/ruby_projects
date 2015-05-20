require "../../app/views/menu_view"

RSpec.describe MenuView do
  before(:all) { @view = MenuView.new(["Gas", "Map"]) }

  describe '#welcome_message' do
    before do
      allow(@view).to receive(:get_action).and_return(0)
    end

    it 'should return the users selection' do
      user_selected = @view.welcome_message
      expect(user_selected).to eq 0
    end
  end

end