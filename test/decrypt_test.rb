gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/decrypt'
require 'pry'

class DecryptTest < Minitest::Test

  attr_reader :offset

  def setup
    key = Key.new.generate_key
    date = Date_Offset.new.generate_date_offset
    @offset = Offset.new.generate_total_offset
  end

  def test_the_character_array_is_complete
    e = Decrypt.new("abc", @offset)
    character_array_to_numbers = (0..39).to_a
    assert_equal character_array_to_numbers, e.characters.index_at
  end

  def test_it_converts_a_number_to_a_letter
    e = Decrypt.new(0, @offset)
    assert_equal "a", e.generate_message_from_numbers
  end

  def test_it_converts_multiple_numbers_to_letters
    e = Decrypt.new(0,1,2, @offset)
    assert_equal "abc", e.generate_message_from_numbers
  end

  def test_the_character_array_is_complete
    e = Decrypt.new(message, offset)
    complete_character_array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, ".", ",", " "]
    assert_equal complete_character_array, e.character_range
  end

  def test_there_are_39_characters_in_array
    e = Decrypt.new(message, offset)
    assert_equal 39, e.character_range.length
  end

  def test_one_letter_maps_correctly_to_index
    e = Decrypt.new(offset)
    assert_equal [0], e.character_index_value("a")
  end

  def test_multiple_letters_to_correct_index
    e = Decrypt.new('fox.', offset)
    assert_equal [5, 14, 23, 36], e.generate_numbers_from_message
  end

  def test_combined_offset_and_numbers_produces_an_array
    e = Decrypt.new(offset)
    assert_equal Array, e.combine_offset_and_numbers.class
  end

  def test_a_string_is_produced
    e = Decrypt.new(offset)
    numbers = e.character_index_value("ruby")
    combined_total = e.combine_offset_and_numbers(numbers)
    reduced = e.reduce_numbers(combined_total)
    assert_equal String, e.generate_decrypted_message(reduced).class
  end

end
