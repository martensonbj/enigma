gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt'
require 'pry'

class EncryptTest < Minitest::Test

  attr_reader :offset

  def setup
    @default_encrypt = Encrypt.new(offset)
    @encrypt_2 = Encrypt.new([12,23,34,45])
    @encrypt_3 = Encrypt.new([10,02,21,13])
    @encrypt_4 = Encrypt.new([96,62,27,70])
  end

  def test_the_character_array_is_complete
    complete_character_array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", ",", " "]
    assert_equal complete_character_array, @default_encrypt.character_range
  end

  def test_there_are_39_characters_in_array
    assert_equal 39, @default_encrypt.character_range.length
  end

  def test_character_array_includes_numbers
    assert @default_encrypt.character_range.include?("1")
  end

  def test_character_array_includes_punctuation
    assert @default_encrypt.character_range.include?(' ')
  end

  def test_one_letter_maps_correctly_to_index
    assert_equal [0], @default_encrypt.character_index_value("a")
  end

  def test_multiple_letters_map_to_correct_index
    assert_equal [0,1,2,3], @default_encrypt.character_index_value("abcd")
  end

  def test_offset_is_added_to_index_values
    array = @encrypt_2.character_index_value("ruby")
    assert_equal [17, 20, 1, 24], array
    assert_equal [29, 43, 35, 69], @encrypt_2.combine_offset_and_numbers(array)
  end

  def test_another_string_with_numbers_matches_expected_output
    array = @encrypt_3.character_index_value("boo1.")
    assert_equal [1, 14, 14, 27, 36], array
    assert_equal [11, 16, 35, 40, 46], @encrypt_3.combine_offset_and_numbers(array)
  end

  def test_reduce_correctly_reduces_a_number_under_39
    array = @encrypt_2.character_index_value("b")
    assert_equal [1], array
    a = @encrypt_2.combine_offset_and_numbers(array)
    assert_equal [13], @encrypt_2.reduce_numbers(a)
  end

  def test_reduce_correctly_reduces_a_number_over_39
    array = @encrypt_2.character_index_value(".")
    assert_equal [36], array
    a = @encrypt_2.combine_offset_and_numbers(array)
    assert_equal [9], @encrypt_2.reduce_numbers(a)
  end

  def test_it_encrypts
    numbers = @encrypt_4.character_index_value("hat")
    combined_total = @encrypt_4.combine_offset_and_numbers(numbers)
    reduced = @encrypt_4.reduce_numbers(combined_total)
    assert_equal "zxh", @encrypt_4.generate_encrypted_message(reduced)
    binding.pry
  end

end
