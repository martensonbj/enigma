gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/date_offset'

class DateOffsetTest < Minitest::Test

  def setup
    @date_new = Date_Offset.new
  end

  def test_there_is_a_date_class
    assert Date_Offset
  end

  def test_date_must_be_a_number
    skip
    date = Date_Offset.new("hi")
    assert_raise
  end

  def test_date_is_created_without_input
    refute_equal nil, @date_new.generate_todays_date
  end

  def test_date_is_created_with_input
    date = Date_Offset.new(111285)
    assert_equal [1, 2, 2, 5], date.generate_given_date

  end

  def test_final_array_is_4_characters
    assert_equal 4, @date_new.date_offset.length
  end

  def test_user_can_input_date
    new_date = Date_Offset.new(121185)
    assert_equal [4, 2, 2, 5], new_date.date_offset
  end

end
