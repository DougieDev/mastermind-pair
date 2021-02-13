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
    @turn = Turn.new(@codemaker, @codebreaker)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end
end
