class Player
  attr_reader :moves

  def initialize(representation)
    @symbol = representation
    @moves = 0
  end

  def increment_moves
    @moves += 1
  end

  def to_s
    @symbol
  end
end