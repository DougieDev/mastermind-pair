require 'minitest/autorun'
require 'minitest/pride'
require './lib/codemaker'

class CodeMakerTest < Minitest::Test
  def setup
    @codemaker = Codemaker.new
  end

  def test_it_exists
    assert_instance_of Codemaker, @codemaker
  end

  def test_it_starts_with_colors_and_empty_code_array
    assert_equal ["R", "G", "B", "Y"], @codemaker.colors
    assert_equal [], @codemaker.code
  end

  def test_randomizing_code
    @codemaker.randomize
    assert_equal false, @codemaker.code == @codemaker.colors

    @codemaker.code.clear
    @codemaker.randomize
    assert_equal false, @codemaker.code == @codemaker.colors

    @codemaker.code.clear
    @codemaker.randomize
    assert_equal false, @codemaker.code == @codemaker.colors
  end
end
