gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/offset'
require 'pry'

class OffsetTest < Minitest::Test


  #KEY
  def test_there_is_a_key_method
    key = Key.new
    assert_equal key, key
  end

  def test_key_generates_a_5_digit_number
    key = Key.new
    num = key.generate_key
    assert_equal 5, num.to_s.length
  end

  def test_it_generates_different_keys_each_run
    key = Key.new
    first_key = key.generate_key
    second_key = key.generate_key
    refute_equal first_key, second_key
  end

  #KEY OFFSET

  def test_it_takes_a_5_digit_number
    offset = Offset.new(key)
    assert_equal 5, offset.generate_key_offset("12345")
  end

  def test_the_input_key_is_a_string
    offset = Offset.new(value)
    assert_equal "String", value.class
  end

  def test_the_generated_key_is_an_array
    offset = Offset.new(value)
    assert_equal "Array", key_array.class
  end

  def test_it_generates_an_array_of_4_elements
    offset = Offset.new(value)
    assert_equal 4, offset.length
    assert_equal "Array", offset.class
  end

  def test_it_generates_an_expected_array
    offset = Offset.new(value)
    assert_equal [12, 23, 34 ,45], offset.generate_key_offset("12345")
  end

  # DATE



end
