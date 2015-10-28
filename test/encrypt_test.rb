gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt'
require 'pry'

class EncryptTest < Minitest::Test

  attr_reader :offset

  def test_the_character_array_is_complete
    e = Encrypt.new(message, offset)
    complete_character_array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, ".", ",", " "]
    assert_equal complete_character_array, e.character_range
  end

  def test_there_are_39_characters_in_array
    e = Encrypt.new(message, offset)
    assert_equal 39, e.character_range.length
  end

  def test_one_letter_maps_correctly_to_index
    e = Encrypt.new('a', offset)
    assert_equal [0], e.character_index_value
  end

  def test_multiple_letters_to_correct_index
    e = Encrypt.new('fox.', offset)
    assert_equal [5, 14, 23, 36], e.character_index_value
  end

  def test_offset_is_added_to_index_values
    skip
    e = Encrypt.new('ruby', [12,23,34,45])
    array = e.character_index_value
    assert_equal [17, 20, 1, 24], array
    assert_equal [29, 43, 35, 69], e.combine_offset_and_numbers(array)
  end

  def test_reduce_numbers_produces_an_array
    e = Encrypt.new('ruby', offset)
    assert_equal Array, e.reduce_numbers.class
  end

  def test_reduce_numbers_reduces_one_number
    e = Encrypt.new('ruby', [12,23,34,45])
  end

  def test_a_string_is_produced
    e = Encrypt.new('huzzah', offset)
    assert_equal String, e.generate_encrypted_message.class
  end


end
