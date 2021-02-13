require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/codemaker'
require './lib/codebreaker'
require './lib/message'

class TurnTest < Minitest::Test
  def setup
    @codemaker = Codemaker.new
    @codebreaker = Codebreaker.new(@codemaker)
    @message = Message.new
    @turn = Turn.new(@codemaker, @codebreaker, @message)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_can_find_code
    assert_equal @codemaker.code, @turn.find_code
  end

  def test_it_can_check_length
    @codebreaker.guess_code("rrr")

    assert_equal @message.short_answer, @turn.guess_length_check

    @codebreaker.guess_code("rrryy")

    assert_equal @message.long_answer, @turn.guess_length_check
  end
end
