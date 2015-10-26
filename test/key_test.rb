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
    refute_equal nil, @new_key.generate_key
  end

  def test_key_generates_a_4_digit_key
    num = @new_key.generate_key
    assert_equal 4, num.length
  end

  def test_it_generates_different_keys_each_run
    first_key = @new_key.generate_key
    second_key = @new_key.generate_key
    refute_equal first_key, second_key
  end

  def test_the_user_gives_a_5_digit_number
    key = Key.new(12345)
    new_offset = key.generate_key
    assert_equal [12, 23, 34, 45], new_offset
  end

end
