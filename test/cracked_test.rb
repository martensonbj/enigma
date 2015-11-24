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
  end

  def test_message_is_split_into_an_array
    assert_equal ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'], @cr0.split_message
  end

  def test_target_last_four_gets_last_four_digits
    assert_equal ['e', 'f', 'g', 'h'], @cr0.target_last_four_characters
  end

  def test_known_end_of_message_positions_are_accurate
    assert_equal [13, 3, 36, 36], @cr0.known_end_of_message_positions
  end


end
