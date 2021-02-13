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

  


end