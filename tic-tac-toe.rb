require 'pry-byebug'

class Board
  @@winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  def initialize
    @board_squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @placed_squares = 0
    @has_winner = false
  end

  def has_winner?
    @has_winner = @@winning_combinations.any? do |index_combinations|
      @board_squares[index_combinations[0]] == @board_squares[index_combinations[1]] && @board_squares[index_combinations[1]] == @board_squares[index_combinations[2]]
    end
  end

  def show_board
    puts "#{@board_squares[0]}|#{@board_squares[1]}|#{@board_squares[2]}"
    puts '-----'
    puts "#{@board_squares[3]}|#{@board_squares[4]}|#{@board_squares[5]}"
    puts '-----'
    puts "#{@board_squares[6]}|#{@board_squares[7]}|#{@board_squares[8]}"
  end

  def play(position, character)
    return false if position <= 0 || position > 9

    return false unless @board_squares[position - 1] == position

    @board_squares[position - 1] = character
    @placed_squares += 1
    true
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
    puts 'What is your name, player 1?'
    @player1_name = gets.chomp
    puts "\nWhat is your name, player 2?"
    @player2_name = gets.chomp
    puts "\nLet the game begin!\n"

    @board.show_board
    until @board.has_winner? || !@board.can_be_won?
      current_player = @turn_count.odd? ? @player1_name : @player2_name
      current_character = @turn_count.odd? ? 'O' : 'X'
      puts "\nWhere will you place your #{current_character}, #{current_player}?"
      position = gets.chomp.to_i

      next unless @board.play(position, current_character)

      puts
      @board.show_board
      @turn_count += 1
      puts
    end

    game_end_message = @board.has_winner? ? "#{current_player} has won!" : "It's a draw.."
    puts game_end_message
  end
end

tic_tac_toe = Game.new
tic_tac_toe.start
