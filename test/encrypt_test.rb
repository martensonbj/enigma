gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt'
require 'pry'

class EncryptTest < Minitest::Test

  attr_reader :offset

  def test_the_character_array_is_complete
    e = Encrypt.new(offset)
    complete_character_array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, ".", ",", " "]
    assert_equal complete_character_array, e.character_range
  end

  def test_there_are_39_characters_in_array
    e = Encrypt.new(offset)
    assert_equal 39, e.character_range.length
  end

  def test_one_letter_maps_correctly_to_index
    e = Encrypt.new(offset)
    assert_equal [0], e.character_index_value("a")
  end

  def test_multiple_letters_to_correct_index
    e = Encrypt.new(offset)
    assert_equal [0,1,2,3], e.character_index_value("abcd")
  end

  def test_offset_is_added_to_index_values
    offset = [12,23,34,45]
    e = Encrypt.new(offset)
    array = e.character_index_value("ruby")
    assert_equal [17, 20, 1, 24], array
    assert_equal [29, 43, 35, 69], e.combine_offset_and_numbers(array)
  end

  def test_a_string_is_produced
    e = Encrypt.new(offset)
    numbers = e.character_index_value("ruby")
    combined_total = e.combine_offset_and_numbers(numbers)
    reduced = e.reduce_numbers(combined_total)
    assert_equal String, e.generate_encrypted_message(reduced).class
  end


end
