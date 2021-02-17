require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/codemaker'
require './lib/codebreaker'
require './lib/message'

class TurnTest < Minitest::Test
  def setup
    @codemaker = Codemaker.new
    @codemaker.code = ["R", "G", "B", "Y"]
    @codebreaker = Codebreaker.new
    @message = Message.new
    @turn = Turn.new(@codemaker, @codebreaker, @message)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_can_find_code
    assert_equal @codemaker.code, @turn.find_code
  end

  def test_for_winner
    @codebreaker.guess_code("rgby")
    assert_equal true, @turn.has_won?
  end

  def test_it_can_evaluate_num_correct_colors
    @codebreaker.guess_code("yrbr")

    assert_equal 3, @turn.num_correct_colors
  end

  def test_it_can_evaluate_num_correct_positions
    @codebreaker.guess_code("yrbr")

    assert_equal 1, @turn.num_correct_positions
  end

  def test_it_can_count_number_of_guesses
    assert_equal 0, @turn.number_of_guesses

    @turn.add_guess

    assert_equal 1, @turn.number_of_guesses
  end
end
