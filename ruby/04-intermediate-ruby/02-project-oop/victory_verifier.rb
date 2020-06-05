module VictoryVerifier

  public

  def verify(board, row, col)
    is_row_complete(board, row) ||
        is_column_complete(board, col) ||
        (row == col && is_diagonal_complete(board)) ||
        (row + col == board.length - 1 && is_reverse_diagonal_complete(board))
  end

  private

  def is_row_complete(board, row)
    first = board[row][0]
    cols = board[row].length

    1.upto(cols - 1) do |col|
      return false if first != board[row][col]
    end

    true
  end

  def is_column_complete(board, col)
    first = board[0][col]
    rows = board.length

    1.upto(rows - 1) do |row|
      return false if first != board[row][col]
    end

    true
  end

  def is_diagonal_complete(board)
    first = board[0][0]
    rows = board.length

    1.upto(rows - 1) do |index|
      return false if first != board[index][index]
    end

    true
  end

  def is_reverse_diagonal_complete(board)
    size = board.length
    first = board[0][size -1]

    1.upto(size - 1) do |index|
      return false if first != board[index][size - 1 - index]
    end

    true
  end
end