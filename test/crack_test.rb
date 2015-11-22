gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/crack'
require_relative '../lib/enigma'
require 'pry'

class DecryptTest < Minitest::Test

  attr_reader :offset

  def setup
    @cr = Crack.new("hi..end..")
    @cr2 = Crack.new("xx123xx")
  end

  def test_class_exists
    assert @cr
  end

  def test_character_map_contains_period
    assert @cr.character_range.include?(".")
  end

  def test_character_map_contains_39_letters
    assert_equal 39, @cr.character_range.count
  end

  def test_crack_takes_message_and_reverses_it
    assert_equal "..dne..ih", @cr.reverse_message
  end

  def test_it_splits_message_into_an_array
    assert_equal([".", ".", "d", "n", "e", ".", ".", "i", "h"], @cr.split_reversed_message)
  end

  def test_it_maps_array_onto_character_map_to_get_letter_value
    assert_equal [36, 36, 3, 13, 4, 36, 36, 8, 7], @cr.character_index_value
  end

  def test_it_grabs_the_first_7_letters
    target_message_key = [36, 36, 3, 13, 4, 36, 36]
    assert_equal [36, 36, 3, 13, 4, 36, 36], @cr.target_message
  end

  def test_it_calculates_new_rotation_info
    assert_equal [13, 13, -26, -15, -23, 13, 13], @cr2.character_value_difference
  end

  def test_select_offset_values_takes_first_four_digits
    assert_equal [13, 13, -26, -15], @cr2.crack_offset
  end

  # def test_figure_shit_out_returns_something
  #   assert_equal [1,2,3,4], @cr.figure_out_shit
  # end



end
