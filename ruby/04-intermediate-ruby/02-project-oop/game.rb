require './victory_verifier.rb'
require './game.rb'
require './board.rb'
require './player.rb'

class Game
  include VictoryVerifier

  def initialize(size, player1, player2)
    @board = Board.new(size)
    @player1 = Player.new($player_1, player1)
    @player2 = Player.new($player_2, player2)
    @turn = @player1
  end

  public

  def restart
    @board.reset
  end

  def move(row, col)
    @board.move(row, col, @turn.id)
    @board.display

    # Check for a winner
    game_over = verify(@board.board, row, col)
    if game_over == true
      puts "#{@turn.name} has won!"
    else
      @turn = @turn == @player1 ? @player2 : @player1
    end
  end
end