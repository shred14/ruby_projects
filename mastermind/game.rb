require_relative 'guess'

class Game

  def initialize
    generate_code!(Rules::Max_code_length, Rules::Possible_peg_colors)
    @max_turns = Rules::Max_turns
    @turns = []
    initialize_rule_values
  end

  def run
    loop do
      break unless game_over?
      take_turn
    end
  end

  def take_turn
    add_guess(request_guess)
    show_game_status
  end

  #--------------------------------------
  private

  def code
    @code
  end

  def show_game_status
    last_guess.evaluate_with(code)
    puts last_guess.feedback
    puts "Game over!" if game_over?
  end

  def game_over?
    guess.correct? || out_of_turns?
  end

  def out_of_turns?
    @turns.length == @max_turns
  end

  def last_guess
    @turns.last
  end

  def request_guess
    puts "Make a guess.."
    guess = Guess.new(input)
    if guess.valid?
      guess
    else
      puts guess.invalid_message
      request_guess
    end
  end

  def input
    gets.chomp
  end

  def add_guess(guess)
    @turns << guess
  end

  def generate_code!(code_length, peg_colors)
    @code ||= []
    code_length.times { @code << random_color(peg_colors) }
  end

  def random_color(peg_colors)
    peg_colors.sample
  end

  #--------------------------------------
end