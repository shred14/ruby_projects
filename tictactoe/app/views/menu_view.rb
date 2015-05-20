class MenuView

  def initialize(options)
    @menu_options = options
  end

  def show
    display_menu
  end

  def menu
    message = "\n\nWelcome to Tic Tac Toe:\n\tWould you like to:\n"
    message << @menu_options.map { |key,option| "\t#{option}" }.join("\n")
    message
  end

  def exit_message
    "\nExiting....\n"
  end


  #Error messages
  def ambiguous_input_message(possible_matches)
    "Input matches #{possible_matches.join(' or ')}. Please be more specific."
  end

  def invalid_input_message
    "Invalid input! Please select an option"
  end

  def display_menu
    display menu
    user_input
  end

  def display_error(error)
    display error
    display_menu
  end

  def display(message)
    puts message
  end

  private

    def outline(message)
      line = '-' * 40
      [line,message,line].join("\n")
    end

    def user_input
      gets.chomp
    end
end