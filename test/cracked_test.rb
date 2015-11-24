gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cracked'
require_relative '../lib/enigma'
require 'pry'

class CrackedTest < Minitest::Test

  def setup
    @cr0 = Cracked.new("abcdefgh")
    @cr1 = Cracked.new("abcdefghi")
    @cr2 = Cracked.new("abcdefghij")
    @cr3 = Cracked.new("abcdefghijk")
  end

  def test_message_is_split_into_an_array
    assert_equal ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'], @cr0.split_message
  end

  def test_target_last_four_gets_last_four_digits
    assert_equal ['e', 'f', 'g', 'h'], @cr0.target_last_four_characters
  end

  def test_known_end_of_message_positions_are_accurate
    assert_equal [13, 3, 36, 36], @cr0.known_char_positions
  end

  def test_get_last_four_unknown_indexes_gets_new_number
    assert_equal [4, 5, 6, 7], @cr0.unknown_char_positions
  end

  def test_get_differences_subracts_values
    assert_equal [-9, 2, -30, -29], @cr0.get_difference_between_indexes
  end

  def test_calculate_modulo_gets_remainder
    assert_equal 0, @cr0.calculate_modulo
    assert_equal 1, @cr1.calculate_modulo
    assert_equal 2, @cr2.calculate_modulo
    assert_equal 3, @cr3.calculate_modulo
  end

  def test_calculate_rotations_does_that
    assert_equal [30, 2, 9, 10], @cr0.calculate_rotations
    assert_equal [31, 3, 10, 11], @cr1.calculate_rotations
  end

  def test_rotation_a_is_30
    assert_equal 30, @cr0.rotation_n
  end

  def test_rotation_b_is_2
    assert_equal 2, @cr0.rotation_d
  end

  def test_rotation_c_is_9
    assert_equal 9, @cr0.rotation_dot
  end

  def test_rotation_d_is_30
    assert_equal 10, @cr0.rotation_dot_two
  end

  def test_find_rotation_from_modulo_gets_rotation
    assert_equal [30, 2, 9, 10], @cr0.find_rotation_from_modulo
    assert_equal [11, 31, 3, 10], @cr1.find_rotation_from_modulo
  end

  def test_message_position_values_returns_values
    assert_equal [0, 1, 2, 3, 4, 5, 6, 7], @cr0.message_position_values
  end

  def test_combine_message_calculates_new_array
    modulo = [30, 2, 9, 10]
    assert_equal [-30, -1, -7, -7, -26, 3, -3, -3], @cr0.combine_message_index_and_crack_offsets(modulo)
  end

  def test_reduce_array_reduces_array
    assert_equal [9, 38, 32, 32, 13, 3, 36, 36], @cr0.reduce_numbers
  end

  def test_crack_message_converts_reduced_array
    assert_equal "j 66nd..", @cr0.crack_message
  end


end
