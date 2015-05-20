require_relative '../controllers/menu_controller'

class GameSession
  BOARD_SIZE = 3
  PLAYER_QUANTITY = 2

  def initialize
    @controller = MenuController.new
  end

  def run
    while @controller do 
      @controller = @controller.run
      puts @controller.class
    end
  end
end