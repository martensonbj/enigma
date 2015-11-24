gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'

class KeyTest < Minitest::Test

  def setup
    @new_key = Key.new
  end

  def test_class_key_exists
    assert Key
  end

  def test_key_generates_a_4_digit_random_key
    num = @new_key.generate_key
    assert_equal 4, num.length
  end

  def test_key_offset_is_an_array
    assert_equal Array, @new_key.generate_key.class
  end

  def test_it_generates_different_keys_each_run
    first_key = @new_key.generate_key
    second_key = @new_key.generate_key
    refute_equal first_key, second_key
  end

  def test_the_user_can_input_a_5_digit_number
    key = Key.new(12345)
    assert_equal [12, 23, 34, 45], key.generate_key
  end

  def test_the_user_can_input_a_different_number
    key = Key.new(92847)
    assert_equal [92, 28, 84, 47], key.generate_key
  end

end
