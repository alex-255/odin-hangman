# frozen_string_literal: true

require_relative 'board'

class Game
  def initialize
    @board = Board.new
  end

  def make_guess
    puts 'Make your guess. Enter a letter of your choice:'
    gets.chomp
  end

  def play
    guesses = 7
    @board.render
    while @board.board.include?('_')
      if guesses == 0
        puts 'You lose.'
        break
      end
      guess_letter = make_guess
      if @board.secret_array.include?(guess_letter)
        puts 'You guessed right.'
        @board.add_letter(guess_letter)
      else
        guesses -= 1
        puts "#{guesses} left."
      end
      @board.render
    end
    puts 'You won. Congratulations!' unless @board.board.include?('_')
  end
end

game = Game.new
game.play
