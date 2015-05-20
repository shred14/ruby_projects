class Guess
  include Rules

  attr_reader :correct_pegs, :mismatched_correct_pegs

  def initialize(input)
    pegs = input
  end

  def valid?
    correct_length? && valid_peg_colors?
  end

  def evaluate_with(code)
    code_pool = code.dup

    correct_pegs = matching_pegs!(include_index_check = true, code_pool)
    mismatched_correct_pegs = matching_pegs!(code_pool)
  end

  def correct?
    max_code_length == correct_pegs
  end

  def feedback
    if correct?
      "You have won!"
    else
      message = "Correct colors at correct place #{guess.correct_pegs}\n"
      message << "There is at least one peg with correct color but incorrect place." if guess.mismatched_correct_pegs > 0
      message
    end
  end

  def invalid_message
    return nil if valid?
    message = "Invalid Guess:\n"
    message << "Guess must have at least 4 colors separated by a space \n "
    message << "Each color must be one of: " << Rules::possible_peg_colors.join("\n") unless correct_length?
    message  
  end

  #----------------------------------
  private
  def valid_peg_colors?
    pegs.all(&valid_color)
  end

  def correct_length?
    @pegs.length == max_code_length
  end

  def pegs=(value)
    @pegs ||= format_raw(value)
  end

  def matching_pegs!(include_index_check = false, code_pool)
    count = 0

    @pegs.each_with_index do |color,index|
      match = include_index_check ? (code[index] == color) : (code_pool.include? color)

      if match
        code_pool.delete_at(code_pool.index(color))
        count += 1
      end
    end
    count
  end

  def format_raw(raw_guess)
    raw_guess.upcase!
    pegs = raw_guess.split(/\W+/)
    pegs.reject!(&:empty?)
    pegs.each(&:upcase!)
    pegs
  end
  #----------------------------------
end