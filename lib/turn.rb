class Turn
  attr_reader :message, :codemaker, :codebreaker, :number_of_guesses

  def initialize(codemaker, codebreaker, message)
    @codemaker = codemaker
    @codebreaker = codebreaker
    @message = message
    @guess = nil
    @winner = false
    @number_of_guesses = 0
  end

  def find_code
    @codemaker.code
  end

  def guess_length_check
    if @codebreaker.guess.length < 4
        @message.short_answer
    elsif @codebreaker.guess.length > 4
           @message.long_answer
    end
  end

  def has_won?
    @winner = true if @codebreaker.guess == @codemaker.code
  end

  def num_correct_colors
    @codemaker.code.length - (@codemaker.code - @codebreaker.guess).count
  end

  def num_correct_positions
    @zipped_array = @codemaker.code.zip(@codebreaker.guess)
    @num_correct_positions = @zipped_array.select do |array|
      array[0] == array[1]
    end
    @num_correct_positions.count
  end

  def add_guess
    @number_of_guesses += 1
  end

end
