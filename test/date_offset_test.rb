gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/date_offset'
require 'pry'

#NEED MORE TESTS???

class DateOffsetTest < Minitest::Test

  def setup
    @date_new = Date_Offset.new
  end

  def test_generate_date_creates_a_6_digit_date
    date = Time.new.strftime("%d%m%y").to_i
    assert_equal 6, date.length
  end


  def test_final_array_is_4_characters
    assert_equal 4, @date_new.generate_date_offset.length
  end




end
