class Rules

  def initialize(board)
    @board = board
    @board_size = Math::sqrt(board.length)
  end

  def game_over?
    return possible_moves?
  end

  def winner
    find_winner_by_rows || find_winner_by_columns
  end

  def possible_moves?
    return false if winner
    possible_moves_by_group?(@board) || possible_moves_by_group?(@board.transpose)
  end

  private

  def find_winner_by_rows
    find_winner_by_group(@board)
  end

  def find_winner_by_columns
    find_winner_by_group(@board.transpose)
  end

  def possible_moves_by_group?(tiles)
    tiles.each_slice(@board_size) do |group|
      return true if group.all? { |tile| tile.player.nil? }
      item = group.find{ |tile| !tile.player.nil? }
      return true if group.all? { |tile| tile.player.nil? || tile.player == item.player }
    end
    false
  end

  def find_winner_by_group(tiles)
    tiles.each_slice(@board_size) do |group|
      next unless group.none? { |tile| tile.player.nil? }
      item = group[0]
      return item.player if group.all? { |tile| tile.player == item.player }
    end
    nil
  end

end