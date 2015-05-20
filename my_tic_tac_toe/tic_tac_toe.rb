require_relative 'view'

def make_view
  @view = View.new(menu_contents)
end

def exit_app
  puts "The user wishes to exit"
  exit
end

def menu_contents
  ["Play a Game?", "Exit the Game?"]
end

def play_command
  "play"
end

def exit_command
  "exit"
end

def command_unknown
  @view.use_input_unknown
end

def play_game
  @view.use_play_game
end

def interpret_input(input)
  case input
  when play_command
    play_game
  when exit_command
    exit_app
  else
    command_unknown
  end
end

make_view
@view.use_main


loop do
  @view.display
  interpret_input @view.user_input
end