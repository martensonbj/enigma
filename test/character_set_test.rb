gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/char_set'
require 'pry'

class CharacterSetTest < Minitest::Test

  def test_it_includes_a_lowercase_letter
    char = CharSet.new
    assert char.character_set.include?("x")
  end

  def test_it_includes_a_period
    char = CharSet.new
    assert char.character_set.include?(".")
  end

  def test_it_includes_a_comma
    char = CharSet.new
    assert char.character_set.include?(",")
  end

  def test_it_includes_a_space
    char = CharSet.new
    assert char.character_set.include?(" ")
  end

  def test_it_is_39_characters_long
    char = CharSet.new
    assert_equal 39, char.character_set.length
  end

end
