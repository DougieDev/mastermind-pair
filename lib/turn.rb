class Turn
  attr_reader :codemaker,
              :codebreaker,
              :number_of_guesses

  def initialize(codemaker, codebreaker)
    @codemaker = codemaker
    @codebreaker = codebreaker
  end

  def has_won?
    @codebreaker.guess == @codemaker.code
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
end
