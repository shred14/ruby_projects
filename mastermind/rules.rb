module Rules

  def Max_code_length
    4
  end

  def Max_turns
    12
  end

  def Possible_peg_colors
    %w(RED BLUE GREEN PURPLE GOLD ORANGE)
  end

  def Valid_color(color)
    possible_colors.includes?(color)
  end

end