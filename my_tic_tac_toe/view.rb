class View

  def initialize(menu_items)
    @menu = Menu.new
    menu_items.each { |item| @menu.choice()}
    @output = ""
  end

  def user_input
    gets.chomp.downcase
  end

  def display
    puts @output
    clear_output
  end

  def use_main
    add_to_output welcome_message
    add_to_output menu
  end

  def use_input_unknown
    add_to_output "The user said something unknown"
  end

  def use_play_game
    add_to_output "The user wishes to play"
  end

  private

    def add_to_output(string)
      @output << add_newline(string)
    end

    def clear_output
      @output = ""
    end

    def add_newline(string)
      string << "\n"
    end

    def welcome_message
      "Welcome to Tic Tac Toe\nWhat would you like to do?"
    end

    def menu
      @menu.join("\n")
    end
end