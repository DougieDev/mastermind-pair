class Codebreaker
  attr_reader :guess

  def guess_code(player_input)
    @guess = player_input.upcase.split("")
  end
end
