gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/date_offset'
require 'pry'

class DateOffsetTest < Minitest::Test

  def setup
    @date_new = Date_Offset.new
  end

  def test_final_array_is_4_characters
    assert_equal 4, @date_new.date_offset.length
  end

  def test_user_can_input_date
    new_date = Date_Offset.new(121185)
    assert_equal [4, 2, 2, 5], new_date.date_offset
  end

end
