require 'board'
require 'game_recording'

class Game
  attr_reader :board
  
  def initialize(board, player_one, player_two, game_type = ConsoleGame.new)
    @board = board
    @player_one = player_one
    @player_two = player_two
    @game_type = game_type
    @game_recording = GameRecording.new(game_type)
  end

  def make_move
    move = @player_one.next_move(@board)
    if @board.valid_position?(move)
      @game_recording.move(move, @player_one.mark)
      @board = @board.mark(move, @player_one.mark)
      rotate_turns
    else
      @game_type.display_invalid_move
    end
  end

  def is_over?
    @board.is_won? || @board.has_draw?
  end

  def start
    until is_over?
      @game_type.display_board(@board)
      make_move
    end
    @game_type.game_over(@board)
  end

  def recording
    @game_recording
  end

  private

  def rotate_turns
    temp = @player_one
    @player_one = @player_two
    @player_two = temp
  end
end
