class Board
  $no_player = 0
  $player_1 = 1
  $player_2 = 2
  $players = {$no_player => " ", $player_1 => "x", $player_2 => "o"}

  attr_reader :board

  def initialize(size)
    @size = size
    reset_board
  end

  public

  def display
    0.upto(@size - 1) do |row|
      # Display a row + return to a new line at the end
      0.upto(@size - 1) do |col|
        print " #{@board[row][col]} "
        print "|" if col < @size - 1
      end
      puts ""

      # Draw a line to separate 2 different rows + return to a new line at the end
      if row < @size - 1
        0.upto(@size - 1) do |col|
          print "---"
          print "|" if col < @size - 1
        end
        puts ""
      end
    end

    puts ""
  end

  def move(row, col, player_id)
    @board[row][col] = $players[player_id]
  end

  def reset
    reset_board
  end

  private

  def reset_board
    @board = Array.new(@size) { Array.new(@size, $players[$no_player]) }
  end
end