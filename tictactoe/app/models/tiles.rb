require_relative 'tile'

class Tiles
  attr_reader :length
  attr_reader :board

  def initialize(n)
    @grid_size = n
    @length = n*n
    construct_board
  end

  def construct_board
    @board = []
    @grid_size**2.times { @board << Tile.new }
  end

  def take_tile(tile_index, player)
    #assumption that tile index laplace correction
    tile = @board[tile_index -1]

    if tile.taken?
      return nil
    else
      tile.player = player
      player.increment_moves
    end
    tile
  end

  def to_s(magnify_factor=3)
    row_separator = '-' * (magnify_factor * @grid_size + @grid_size - 1)
    column_separator = '|'

    result = ""
    @board.each_slice(@grid_size) do |row|
      magnify_factor.times do
        row_tiles.each do |tile|
          result << tile.to_s * magnify_factor + column_separator
        end
        result << "\n"
      end
      result << row_separator
    end
  end
end