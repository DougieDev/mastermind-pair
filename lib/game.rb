require './lib/turn'
require './lib/message'
require './lib/codemaker'
require './lib/codebreaker'

class Game
  attr_reader :turn,
              :message,
              :codemaker,
              :codebreaker

  def initialize
    @message = Message.new
    @codemaker = Codemaker.new
    @codebreaker = Codebreaker.new
    @turn = Turn.new(@codemaker, @codebreaker, @message)
  end

  def start_game
    @message.welcome_message
    # @message.user_input_prompt
    @codemaker.randomize
    start_loop
  end

  def start_loop
    @message.user_input_prompt
    @user_input = gets.chomp.downcase
    initial_selection
  end

  def intro
    @message.play_game
  end

  def show_cheat
    p "The secret code is: #{@codemaker.code.join}"
  end

  def initial_selection
    if @user_input == 'p'
      intro
      game_flow
    elsif @user_input == 'i'
      @message.instructions
      start_loop
    elsif @user_input == 'q'
      @message.quit
      abort
    else
      @message.user_input_prompt
    end
  end


  def game_flow
    until @turn.has_won? do
      @user_guess_prompt = gets.chomp
        if @user_guess_prompt == 'q'
          @message.quit
          abort
        elsif @user_guess_prompt == 'c'
          show_cheat
          game_flow
        end
      @codebreaker.guess_code(@user_guess_prompt)
      @turn.add_guess
      if @codebreaker.guess == @codemaker.code
        @message.winning_guess
        end_game_prompt
        # break
      elsif @codebreaker.guess != @codemaker.code
        @message.user_guess
        incorrect_guess_hint
      end
    end
  end

  def incorrect_guess_hint
    p "#{@codebreaker.guess.join} has #{@turn.num_correct_colors} correct colors with #{@turn.num_correct_positions} in the correct positions."
    p "You've taken #{@turn.number_of_guesses} guess(es)."
  end

  def end_game_prompt
    puts "Congratulations! You guessed the sequence #{@codemaker.code.join} in #{@turn.number_of_guesses} guesses!"
    puts "Do you want to (p)lay again or (q)uit?"
    @response = gets.chomp
      if @response == 'p'
        @codemaker.code.clear
        @codemaker.randomize
        intro
        game_flow
      elsif @response == 'q'
        @message.quit
        abort
      end

    # initial_selection
  end
end
