class GameplayView

  BLOCK_SIZE = 3

  def initialize(tiles, player)
    @player = player
    @tiles = tiles
  end

  def show
    show_board
    display player_input_request
    user_input
  end

  def show_board
    display @tiles.to_s
    display example_grid
  end

  def player_input_request
    "It is player #{@player.to_s}'s turn.\n  Which tile would you like to take?"
  end

  def tile_taken_message
    "This tile has been taken by another player, please select another tile."
  end

  def game_over_message(winner)
    if winner
      "Player #{winner} has won! Game over."
    else
      "It was a draw. Game over"
    end
  end

  private

    def user_input
      gets.chomp
    end

    def display(message)
      puts message
    end

    def example_grid
      size = Math::sqrt @tiles.length
      number_guide = (0..@tiles.length).to_a
      result << "Tile Numbers:\n"

      number_guide.each_slice(size) { |row| result << row.join('|') }
      result
    end
end