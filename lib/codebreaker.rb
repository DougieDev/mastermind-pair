class Codebreaker
  attr_reader :codemaker, :guess

  def initialize(codemaker)
    @codemaker = codemaker
  end

  def guess_code(player_input)
    @guess = player_input.upcase.split("")
  end
end
