class Message

  def welcome_message
    p "Welcome to MASTERMIND"
  end

  def user_input_prompt
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def play_game
    p "I have generated a beginner sequence with four elements made up of: (r)ed,"
    p "(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
    p "What's your guess?"
  end

  def quit
    p "See you next time!"
  end

  def short_answer
    p "That input is too short, you must choose four letters"
  end

  def long_answer
    p "That input is too long, you must only choose four letters"
  end

  def user_guess
    p "That's not correct."
  end

  def instructions
    p "The codemaker has created a 4 digit code featuring (r)ed, (g)reen, (b)lue, and (y)ellow."
    p "It's up to you to guess what order they are in."
    p "There can be multiples of the same color."
  end

  def winning_guess
    p "You got it!"
  end
end
