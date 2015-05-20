require_relative '../views/menu_view'

require_relative '../controllers/gameplay_controller'

class MenuController

  def initialize
    @commands = { create_game:'New Game', exit:'Exit' }
    @view = MenuView.new(@commands)
    @next_controller = self
  end

  def run
    user_input = @view.show
    process_input user_input
    @next_controller
  end

  def process_input(input)
    command = parse input
    perform command
  end

  def parse(input)
    query_result = @commands.select { |key,option| option.downcase.match(input.downcase) }

    if query_result.length > 1
      @view.display_error @view.ambiguous_input_message(query_result)
    elsif query_result.length == 0
      @view.display_error @view.invalid_input_message
    else
      query_result.first[0]
    end
  end

  def perform(command)
    case command
    when :create_game
      @next_controller = GameplayController.new
    when :exit
      exit
    else
      @view.display_error @view.invalid_input_message
    end
  end

  def exit
    @view.display @view.exit_message
    @next_controller = nil
  end
end