class Board
  @@winning_combinations = %w[[0 1 2] [3 4 5] [6 7 8] [0 3 6] [1 4 7] [2 5 8] [0 4 8] [1 4 7]]
  def initialize
    @board_squares = %w[1 2 3 4 5 6 7 8 9]
  end

  def has_winner?
    @@winning_combination.any? { |index_combinations| board_squares[index_combinations[0]] == board_squares[index_combinations[1]] == board_squares[index_combinations[2]] }
  end

  def to_s
    "#{board_squares[0]}|#{board_squares[1]}|#{board_squares[2]}\n" + "-----\n" + "#{board_squares[3]}|#{board_squares[4]}|#{board_squares[5]}\n" + "-----\n" + "#{board_squares[6]}|#{board_squares[7]}|#{board_squares[8]}"
  end
end
