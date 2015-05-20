require_relative 'player'

class Players

  def initialize
    @players = [Player.new('X'), Player.new('O')]
  end

  def current_player
    @players.min { |player| player.moves }
  end
end