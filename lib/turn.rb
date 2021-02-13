class Turn
  attr_reader

  def initialize(codemaker, codebreaker)
    @codemaker = codemaker
    @codebreaker = codebreaker
    @message = Message.new
    @guess = nil
    @winner = false
  end


end
