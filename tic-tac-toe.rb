class Board
  @@winning_combinations = %w[[0 1 2] [3 4 5] [6 7 8] [0 3 6] [1 4 7] [2 5 8] [0 4 8] [1 4 7]]
  def initialize
    @board_squares = %w[1 2 3 4 5 6 7 8 9]
    @placed_squares = 0
    @has_winner = false
  end

  def has_winner?
    @has_winner = @@winning_combination.any? { |index_combinations| board_squares[index_combinations[0]] == board_squares[index_combinations[1]] == board_squares[index_combinations[2]] }
  end

  def show_board
    puts "#{board_squares[0]}|#{board_squares[1]}|#{board_squares[2]}\n" + "-----\n" + "#{board_squares[3]}|#{board_squares[4]}|#{board_squares[5]}\n" + "-----\n" + "#{board_squares[6]}|#{board_squares[7]}|#{board_squares[8]}"
  end

  def play(position, character)
    if (position <= 0 || position > 9) return
      
    if board_squares[position-1].to_i != position
      board_squares[position-1] = character
      @placed_squares += 1
    end
  end

  def can_be_won?
    @placed_squares < 9 && !@has_winner
  end
end

class Game
  def initialize
    @board = Board.new
    @turn_count = 1
  end
  def start
    @player1_name = gets.chomp
    @player2_name = gets.chomp
    unless Board.has_winner? or !Board.can_be_won?
      current_player = (turn_count % 2 == 1) ? @player1_name : @player2_name 
      current_character = (turn_count % 2 == 1) ? 'O' : 'X'
      puts "Where will you place your #{current_character}, #{current_player}?"
      @board.play(position, current_character)
      @board.show_board
      @turn_count += 1
    end

    puts "#{current_player} has won!"
  end
end