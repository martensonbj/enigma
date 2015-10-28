gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/decrypt'
require 'pry'

class DecryptTest < Minitest::Test

  attr_reader :offset

  def setup
    key = Key.new.generate_key
    date = Date_Offset.new.generate_date_offset
    @offset = Offset.new.generate_total_offset
  end

  def test_the_character_array_is_complete
    e = Decrypt.new("abc", @offset)
    character_array_to_numbers = (0..39).to_a
    assert_equal character_array_to_numbers, e.characters.index_at
  end

  def test_it_converts_a_number_to_a_letter
    e = Decrypt.new(0, @offset)
    assert_equal "a", e.generate_message_from_numbers
  end

  def test_it_converts_multiple_numbers_to_letters
    e = Decrypt.new(0,1,2, @offset)
    assert_equal "abc", e.generate_message_from_numbers
  end

end
