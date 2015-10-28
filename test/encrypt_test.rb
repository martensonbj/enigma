gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt'
require 'pry'

class EncryptTest < Minitest::Test

  def test_it_generates_a_string
    e = Encrypt.new('hello')
    assert_equal String, e.encrypt_message
  end

end
