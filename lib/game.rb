class Game
  attr_reader :turn,
              :message,
              :codemaker,
              :codebreaker

  def initialize
    @message = Message.new
    @codemaker = Codemaker.new
    @codebreaker = Codebreaker.new
    @turn = Turn.new(@codemaker, @codebreaker)
    @number_of_guesses = 0
  end

  def start_game
    @message.welcome_message
    @codemaker.randomize
    start_loop
  end

  def start_loop
    @message.user_input_prompt
    @user_input = gets.chomp.downcase
    initial_selection
  end

  def initial_selection
    if @user_input == 'p' || @user_input == 'play'
      @message.play_game
      game_flow
    elsif @user_input == 'i' || @user_input == 'instructions'
      @message.instructions
      start_loop
    elsif @user_input == 'q' || @user_input == 'quit'
      @message.quit
      abort
    else
      @message.user_input_prompt
    end
  end

  def game_flow
    until @turn.has_won? do
      user_guess_prompt = gets.chomp
        if user_guess_prompt == 'q' || user_guess_prompt == 'quit'
          @message.quit
          abort
        elsif user_guess_prompt == 'c' || user_guess_prompt == 'cheat'
          show_cheat
          game_flow
        end
      @codebreaker.guess_code(user_guess_prompt)
      guess_length_check
      add_guess
      evaluate_guess
    end
  end

  def evaluate_guess
    if @codebreaker.guess == @codemaker.code
      @message.winning_guess
      end_game_prompt
    elsif @codebreaker.guess != @codemaker.code
      @message.user_guess
      incorrect_guess_hint
    end
  end

  def end_game_prompt
    p "Congratulations! You guessed the sequence #{@codemaker.code.join} in #{@number_of_guesses} guesses!"
    p "Do you want to (p)lay again or (q)uit?"
    end_game_user_response
  end

  def guess_length_check
    if @codebreaker.guess.length < 4
      @message.short_answer
      game_flow
    elsif @codebreaker.guess.length > 4
      @message.long_answer
      game_flow
    end
  end

  def end_game_user_response
    response = gets.chomp.downcase
    if response == 'p' || response == 'play'
      @codemaker.code.clear
      @codemaker.randomize
      @number_of_guesses = 0
      @message.play_game
      game_flow
    elsif response == 'q' || response == 'quit'
      @message.quit
      abort
    end
  end

  def incorrect_guess_hint
    p "#{@codebreaker.guess.join} has #{@turn.num_correct_colors} correct colors with #{@turn.num_correct_positions} in the correct positions."
    p "You've taken #{@number_of_guesses} guess(es)."
  end

  def add_guess
    @number_of_guesses += 1
  end

  def show_cheat
    p "The secret code is: #{@codemaker.code.join}"
  end
end
