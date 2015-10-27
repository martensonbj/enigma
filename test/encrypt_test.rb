gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt'
require 'pry'

class EncryptTest < Minitest::Test

  def setup
    message = "tarantula"
    key = Key.new.generate_key
    date = Date_Offset.new.generate_date_offset
    offset = Offset.new(key, date).generate_total_offset
    @encrypt = Encrypt.new(message, offset)
  end

  def test_message_is_split_into_an_array_of_numbers
  end

  def test_total_offset_produces_a_value
  end




end
