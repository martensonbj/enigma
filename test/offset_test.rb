gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/offset'
require 'pry'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new
  end

  def test_there_is_a_generated_key
    refute_equal nil, @offset.generate_total_offset
  end

  def test_input_0_equals_array
    
  end

  def test_it_takes_a_5_digit_number
    skip
    offset = Offset.new(key)
    assert_equal 5, offset.generate_key_offset("12345")
  end

  def test_the_input_key_is_a_string
    skip
    offset = Offset.new(value)
    assert_equal "String", value.class
  end

  def test_the_generated_key_is_an_array
    skip
    offset = Offset.new(value)
    assert_equal "Array", key_array.class
  end

  def test_it_generates_an_array_of_4_elements
    skip
    offset = Offset.new(value)
    assert_equal 4, offset.length
    assert_equal "Array", offset.class
  end

  def test_it_generates_an_expected_array
    skip
    offset = Offset.new(value)
    assert_equal [12, 23, 34 ,45], offset.generate_key_offset("12345")
  end

  # DATE

  def test_generate_date_creates_a_6_digit_date
    skip
    date = Date_Offset.new
    assert_equal 6, date.generate_date_offset.length = 6
  end

  def test_final_date_offset_array_is_4_characters
    skip
    date = Date_Offset.new
    assert_equal 4, date.generate_date_offset.size = 4
  end

  def test_date_offset_is_an_array_of_integers
    skip
  end
  # TOTAL OFFSET

  def test_total_offset_is_an_array_of_4_values
    skip
  end



end
