require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/codemaker'
require './lib/codebreaker'

class TurnTest < Minitest::Test
  def setup
    @codemaker = Codemaker.new
    @codemaker.code = ["R", "G", "B", "Y"]
    @codebreaker = Codebreaker.new
    @turn = Turn.new(@codemaker, @codebreaker)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
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
end
