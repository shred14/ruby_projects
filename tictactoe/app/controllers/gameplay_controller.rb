require_relative '../models/tiles'
require_relative '../models/players'

require_relative '../views/gameplay_view'

require_relative '../controllers/menu_controller'

require_relative '../services/rules'

class GameplayController
  BOARD_SIZE = 3

  def initialize
    @next_controller = self
    create_game
    @view = GameplayView.new(@tiles, @players.current_player)
  end

  def run
    game_over_check
    user_input = @view.show
    process user_input
    @next_controller
  end

  def create_game
    @tiles = Tiles.new(BOARD_SIZE)
    @players = Players.new
    @rules = Rules.new(@tiles.board)
  end

  def process(input)
    tile_taken = @tiles.take_tile(input)
    @view.display(@view.tile_taken_message) unless tile_taken
  end

  def game_over_check 
    if @rules.game_over?
      @view.game_over_message(@rules.winner)
      @next_controller = MenuController.new
    end
  end
end