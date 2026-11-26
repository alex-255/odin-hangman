class Board
  attr_reader :board, :secret_array

  def initialize
    secret_word = choose_word
    @secret_array = secret_word.split('')
    @board = create_board
  end

  def create_board
    board_array = []
    secret_array.size.times { board_array.push('_') }
    board_array
  end

  def choose_word
    words = File.readlines('google-10000-english-no-swears.txt', chomp: true)
    word = false
    while word == false
      word = words.sample
      if word.size <= 5 || word.size >= 12
        word = false
        next
      else
        return word
      end
    end
  end

  def add_letter(guess_letter)
    @secret_array.each_with_index do |place, index|
      if place == guess_letter # rubocop:disable Style/IfUnlessModifier
        self.board[index] = guess_letter
      end
    end
  end

  def render
    puts
    puts '===Hangman==='
    print ' '
    @board.size.times { print '__' }
    print "\n|"
    @board.each { |place| print place + ' ' }
    puts '|'
  end

  private

  attr_writer :board
end
