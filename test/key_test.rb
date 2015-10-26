gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'
require 'pry'

class KeyTest < Minitest::Test

  def setup
  @new_key = Key.new
  end

  def test_there_is_a_key_method
    refute_equal nil, @new_key.generate_key_offset
  end

  def test_key_generates_a_5_digit_number
    num = @new_key.generate_key_offset
    assert_equal 4, num.length
  end

  def test_it_generates_different_keys_each_run
    first_key = @new_key.generate_key_offset
    second_key = @new_key.generate_key_offset
    refute_equal first_key, second_key
  end

  def test_it_generates_a_key_offset
    assert_equal 4, @new_key.generate_key_offset.length
  end

end
