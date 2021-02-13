class Turn
  attr_reader :message, :codemaker, :codebreaker

  def initialize(codemaker, codebreaker, message)
    @codemaker = codemaker
    @codebreaker = codebreaker
    @message = message
    @guess = nil
    @winner = false
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




end
