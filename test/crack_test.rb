gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/crack'
require_relative '../lib/enigma'
require 'pry'

class CrackTest < Minitest::Test

  def setup
    @cr = Crack.new("hi..end..")
    @cr2 = Crack.new("xx123xx")
    @cr3 = Crack.new("oi.6lnd6e")
    # @cr3 = Crack.new("s.9spccsi")
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

  def test_it_grabs_the_first_7_letter_indexes
    target_message_key = [36, 36, 3, 13, 4, 36, 36]
    assert_equal [36, 36, 3, 13, 4, 36, 36], @cr.target_message
  end

  def test_it_calculates_new_rotation_info
    assert_equal [13, 13, -26, -15, -23, 13, 13], @cr2.character_value_difference
  end

  def test_select_offset_values_takes_first_four_digits
    assert_equal [13, 13, -26, -15], @cr2.crack_offset
  end

  def test_it_creates_todays_a_date_offset_if_no_date_provided
    assert_equal [3, 2, 2, 5], @cr.date
  end

  def test_crack_offset_iterates_through_entire_message
    offset = [13, 13, -26, -15]
    assert_equal 9, @cr.apply_crack_offset_to_message(offset).length
  end

  def test_first_letter_of_message_is_correctly_subtracted
   offset = [13, 13, -26, -15]
   assert_equal 23, @cr.apply_crack_offset_to_message(offset)[0]
  end

  def test_5th_value_of_message_is_correctly_subtracted
    offset = [13, 13, -26, -15]
    assert_equal -9, @cr.apply_crack_offset_to_message(offset)[4]
  end

  def test_modulo_is_calculated_from_new_values
    offset = [13, 13, -26, -15]
    assert_equal 30, @cr.modulo_of_new_values(offset)[4]
  end

  def test_crack_message_creates_array_of_letters
    char_values = [36, 36, 3, 13, 4, 36, 36, 8, 7]
    offset = [13, 13, -26, -15]
    # assert_equal ["x", "x", "3", "2", "4", "x", "x", "x", "7"], @cr.crack_message
    assert_equal "..dne..ih", @cr.crack_message
  end

  def test_crack_message_cracks_another_message
    assert_equal "l2dns2.iv", @cr3.crack_message
    #<Crack:0x007fbcc2b3c780 @crack_offset=[32, 4, 0, 0], @date=[3, 2, 2, 5], @message="oi.6lnd6e">
  end

  def test_if_modulo_is_0_test_last_4_digits_string
    

end
