require 'minitest/autorun'
require 'minitest/pride'
require './lib/codebreaker'

class CodebreakerTest < Minitest::Test
  def setup
    @codebreaker = Codebreaker.new
  end

  def test_it_exists
    assert_instance_of Codebreaker, @codebreaker
  end

  def test_player_can_make_a_guess
    @codebreaker.guess_code("rrbg")
    assert_equal ["R", "R", "B", "G"], @codebreaker.guess
  end
end
