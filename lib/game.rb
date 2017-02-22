require_relative 'board'

class Game
  def initialize(board, player_one, player_two, game_type = ConsoleGame.new)
    @board = board
    @player_one = player_one
    @player_two = player_two
    @game_type = ConsoleGame.new
  end

  def board
    @board.get
  end

  def make_move
    move = @player_one.next_move(@board) - 1 
    if @board.valid_position?(move)
      @board = @board.mark(move, @player_one.mark)
      rotate_turns
    else
      puts "Invalid position!"
    end
  end

  def is_over?
    @board.is_won? || @board.has_draw?
  end

  def start
    until is_over?
      @game_type.display_board(@board.get)
      make_move
    end
    display_board
    display_winner
  end

  private

  def display_winner
    puts @player_two.mark + " has won the game!"
  end

  def rotate_turns
    temp = @player_one
    @player_one = @player_two
    @player_two = temp
  end
end
