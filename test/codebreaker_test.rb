require 'minitest/autorun'
require 'minitest/pride'
require './lib/codebreaker'
require './lib/codemaker'

class CodebreakerTest < Minitest::Test
  def setup
    @codemaker = Codemaker.new
    @player = Codebreaker.new(@codemaker)
  end

  def test_it_exists
    assert_instance_of Codebreaker, @player
  end
end
