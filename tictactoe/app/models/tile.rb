class Tile
  attr_accessor :player

  def self.player=(val)
    @player ||= val
  end

  def taken?
    @player != nil
  end

  def to_s
    @player.nil? ? '-' : @player.to_s
  end
end