gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/decrypt'
require_relative '../lib/enigma'

class DecryptTest < Minitest::Test

  attr_reader :offset

  def setup
    @default_decrypt = Decrypt.new(offset)
    @decrypt_2 = Decrypt.new([12,23,34,45])
    @decrypt_3 = Decrypt.new([10,02,21,13])
    @decrypt_4 = Decrypt.new([96,62,27,70])
  end

  def test_the_character_array_is_complete
    complete_character_array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", ",", " "]
    assert_equal complete_character_array, @default_decrypt.character_range
  end

  def test_it_converts_a_number_to_a_letter
    e = Enigma.new.encrypt("hat", 93445)
    assert_equal "z.0", e
    d = Enigma.new.decrypt("w.0", 93445)
    assert_equal "eat", d
  end

  def test_there_are_39_characters_in_array
    assert_equal 39, @default_decrypt.character_range.length
  end

  def test_one_letter_maps_correctly_to_index
    assert_equal [0], @default_decrypt.character_index_value("a")
  end

end
