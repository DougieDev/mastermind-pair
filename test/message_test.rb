require 'minitest/autorun'
require 'minitest/pride'
require './lib/message'

class MessageTest < Minitest::Test
  def setup
    @message = Message.new
  end

  def test_it_exists
    assert_instance_of Message, @message
  end

  def test_welcome_message
    assert_equal "Welcome to MASTERMIND", @message.welcome_message
  end

  def test_user_input_prompt
    user_prompt = "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    assert_equal user_prompt, @message.user_input_prompt
  end

  def test_play_game
    play_game_msg = "What's your guess?"
    assert_equal play_game_msg, @message.play_game
  end

  def test_quit
    assert_equal "See you next time!", @message.quit
  end

end