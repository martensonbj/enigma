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

  def test_final_array_is_4_characters
    assert_equal 4, @date_new.date_offset.length
  end

end
