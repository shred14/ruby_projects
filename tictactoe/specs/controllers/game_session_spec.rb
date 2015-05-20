require './app/controllers/game_session'

RSpec.describe GameSession do
  before(:all) { @test_session = GameSession.new }

  describe '#new' do
    it 'should exist' do
      expect(@test_session.respond_to? :new ).to be true
    end
  end
end