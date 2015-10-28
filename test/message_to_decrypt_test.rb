gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/message_to_decrypt'
require 'pry'

class MessageToDecryptTest < Minitest::Test

  attr_reader :offset

  def test_the_character_array_is_complete
    e = MessageToDecrypt.new(message, offset)
    complete_character_array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, ".", ",", " "]
    assert_equal complete_character_array, e.character_range
  end

  def test_there_are_39_characters_in_array
    e = MessageToDecrypt.new(message, offset)
    assert_equal 39, e.character_range.length
  end

  def test_one_letter_maps_correctly_to_index
    e = MessageToDecrypt.new('a', offset)
    assert_equal [0], e.generate_numbers_from_message
  end

  def test_multiple_letters_to_correct_index
    e = MessageToDecrypt.new('fox.', offset)
    assert_equal [5, 14, 23, 36], e.generate_numbers_from_message
  end

  def test_combined_offset_and_numbers_produces_an_array
    e = MessageToDecrypt.new('ruby', offset)
    assert_equal Array, e.combine_offset_and_numbers.class
  end

  def test_reduce_numbers_produces_an_array
    e = MessageToDecrypt.new('ruby', offset)
    assert_equal Array, e.reduce_numbers.class
  end

  def test_a_string_is_produced
    e = MessageToDecrypt.new("j0r9cn", offset)
    assert_equal String, e.generate_decrypted_message.class
  end

end
