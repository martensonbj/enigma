gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/offset'
require 'pry'

class OffsetTest < Minitest::Test

  # HOW TO TEST FOR INPUT TYPES???

  def setup
    # key = Key.new.generate_key
    # date = Date_Offset.new.generate_date_offset
    @offset = Offset.new
  end

  def test_it_receives_a_4_digit_array_as_the_key_offset
    key = Key.new.generate_key
    assert_equal 4, key.length
  end

  def test_it_receives_a_4_digit_array_as_the_date_offset
    date = Date_Offset.new.generate_date_offset
    assert_equal 4, date.length
  end

  def test_it_generates_a_total_offset_of_4_elements
    assert_equal 4, @offset.generate_total_offset.length
    assert_equal Array, @offset.generate_total_offset.class
  end



end
