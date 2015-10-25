gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/key'
require 'pry'

class KeyTest < Minitest::Test

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

end
