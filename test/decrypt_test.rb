gem 'minitest'                     # => true
require 'minitest/autorun'         # => true
require 'minitest/pride'           # => true
require_relative '../lib/decrypt'  # => true
require 'pry'                      # => false

class DecryptTest < Minitest::Test  # => Minitest::Test

  attr_reader :offset  # => nil

  def setup
    key = Key.new.generate_key                   # => [2, 25, 56, 60], [85, 50, 5, 57], [62, 29, 90, 9], [16, 63, 39, 91], [40, 1, 11, 15], [50, 5, 55, 50], [95, 56, 64, 45], [97, 78, 87, 77]
    date = Date_Offset.new.generate_date_offset  # => [0, 2, 2, 5], [0, 2, 2, 5], [0, 2, 2, 5], [0, 2, 2, 5], [0, 2, 2, 5], [0, 2, 2, 5], [0, 2, 2, 5], [0, 2, 2, 5]
    @offset = Offset.new.generate_total_offset   # => [10, 4, 31, 104], [54, 46, 45, 36], [29, 100, 85, 38], [8, 84, 25, 35], [48, 84, 27, 56], [59, 92, 8, 66], [32, 26, 48, 73], [3, 39, 74, 25]
  end                                            # => :setup

  def test_the_character_array_is_complete
    e = Decrypt.new("abc", @offset)
    character_array_to_numbers = (0..39).to_a
    assert_equal character_array_to_numbers, e.characters.index_at
  end                                                               # => :test_the_character_array_is_complete

  def test_it_converts_a_number_to_a_letter
    e = Decrypt.new(0, @offset)
    assert_equal "a", e.generate_message_from_numbers
  end                                                  # => :test_it_converts_a_number_to_a_letter

  def test_it_converts_multiple_numbers_to_letters
    e = Decrypt.new(0,1,2, @offset)
    assert_equal "abc", e.generate_message_from_numbers
  end                                                    # => :test_it_converts_multiple_numbers_to_letters

  def test_the_character_array_is_complete
    e = Decrypt.new(message, offset)
    complete_character_array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, ".", ",", " "]
    assert_equal complete_character_array, e.character_range
  end                                                                                                                                                                                                           # => :test_the_character_array_is_complete

  def test_there_are_39_characters_in_array
    e = Decrypt.new(message, offset)
    assert_equal 39, e.character_range.length
  end                                          # => :test_there_are_39_characters_in_array

  def test_one_letter_maps_correctly_to_index
    e = Decrypt.new(offset)                         # => #<Decrypt:0x007f929ab07fa0 @total_offset=[63, 32, 4, 25]>
    assert_equal [0], e.character_index_value("a")  # => true
  end                                               # => :test_one_letter_maps_correctly_to_index

  def test_multiple_letters_to_correct_index
    e = Decrypt.new('fox.', offset)
    assert_equal [5, 14, 23, 36], e.generate_numbers_from_message
  end                                                              # => :test_multiple_letters_to_correct_index

  def test_combined_offset_and_numbers_produces_an_array
    e = Decrypt.new(offset)                                 # => #<Decrypt:0x007f929a862160 @total_offset=[16, 62, 6, 47]>
    assert_equal Array, e.combine_offset_and_numbers.class
  end                                                       # => :test_combined_offset_and_numbers_produces_an_array

  def test_a_string_is_produced
    e = Decrypt.new(offset)                                           # => #<Decrypt:0x007f929a852580 @total_offset=[43, 37, 57, 56]>
    numbers = e.character_index_value("ruby")                         # => [17, 20, 1, 24]
    combined_total = e.combine_offset_and_numbers(numbers)            # => [-26, -17, -56, -32]
    reduced = e.reduce_numbers(combined_total)                        # => [13, 22, 22, 7]
    assert_equal String, e.generate_decrypted_message(reduced).class
  end                                                                 # => :test_a_string_is_produced

end  # => :test_a_string_is_produced

# >> Run options: --seed 42650
# >>
# >> # Running:
# >>
# >> EEEEEEE.
# >>
# >> Finished in 0.003853s, 2076.4578 runs/s, 259.5572 assertions/s.
# >>
# >>   1) Error:
# >> DecryptTest#test_combined_offset_and_numbers_produces_an_array:
# >> ArgumentError: wrong number of arguments (0 for 1)
# >>     /Users/bmartenson/turing/1module/projects/enigma/lib/decrypt.rb:23:in `combine_offset_and_numbers'
# >>     /Users/bmartenson/turing/1module/projects/enigma/test/decrypt_test.rb:56:in `test_combined_offset_and_numbers_produces_an_array'
# >>
# >>
# >>   2) Error:
# >> DecryptTest#test_a_string_is_produced:
# >> ArgumentError: wrong number of arguments (0 for 1)
# >>     /Users/bmartenson/turing/1module/projects/enigma/lib/decrypt.rb:35:in `reduce_numbers'
# >>     /Users/bmartenson/turing/1module/projects/enigma/lib/decrypt.rb:44:in `generate_decrypted_message'
# >>     /Users/bmartenson/turing/1module/projects/enigma/test/decrypt_test.rb:64:in `test_a_string_is_produced'
# >>
# >>
# >>   3) Error:
# >> DecryptTest#test_it_converts_a_number_to_a_letter:
# >> ArgumentError: wrong number of arguments (2 for 1)
# >>     /Users/bmartenson/turing/1module/projects/enigma/lib/decrypt.rb:6:in `initialize'
# >>     /Users/bmartenson/turing/1module/projects/enigma/test/decrypt_test.rb:24:in `new'
# >>     /Users/bmartenson/turing/1module/projects/enigma/test/decrypt_test.rb:24:in `test_it_converts_a_number_to_a_letter'
# >>
# >>
# >>   4) Error:
# >> DecryptTest#test_multiple_letters_to_correct_index:
# >> ArgumentError: wrong number of arguments (2 for 1)
# >>     /Users/bmartenson/turing/1module/projects/enigma/lib/decrypt.rb:6:in `initialize'
# >>     /Users/bmartenson/turing/1module/projects/enigma/test/decrypt_test.rb:50:in `new'
# >>     /Users/bmartenson/turing/1module/projects/enigma/test/decrypt_test.rb:50:in `test_multiple_letters_to_correct_index'
# >>
# >>
# >>   5) Error:
# >> DecryptTest#test_the_character_array_is_complete:
# >> ArgumentError: wrong number of arguments (2 for 1)
# >>     /Users/bmartenson/turing/1module/projects/enigma/lib/decrypt.rb:6:in `initialize'
# >>     /Users/bmartenson/turing/1module/projects/enigma/test/decrypt_test.rb:34:in `new'
# >>     /Users/bmartenson/turing/1module/projects/enigma/test/decrypt_test.rb:34:in `test_the_character_array_is_complete'
# >>
# >>
# >>   6) Error:
# >> DecryptTest#test_it_converts_multiple_numbers_to_letters:
# >> ArgumentError: wrong number of arguments (4 for 1)
# >>     /Users/bmartenson/turing/1module/projects/enigma/lib/decrypt.rb:6:in `initialize'
# >>     /Users/bmartenson/turing/1module/projects/enigma/test/decrypt_test.rb:29:in `new'
# >>     /Users/bmartenson/turing/1module/projects/enigma/test/decrypt_test.rb:29:in `test_it_converts_multiple_numbers_to_letters'
# >>
# >>
# >>   7) Error:
# >> DecryptTest#test_there_are_39_characters_in_array:
# >> ArgumentError: wrong number of arguments (2 for 1)
# >>     /Users/bmartenson/turing/1module/projects/enigma/lib/decrypt.rb:6:in `initialize'
# >>     /Users/bmartenson/turing/1module/projects/enigma/test/decrypt_test.rb:40:in `new'
# >>     /Users/bmartenson/turing/1module/projects/enigma/test/decrypt_test.rb:40:in `test_there_are_39_characters_in_array'
# >>
# >> 8 runs, 1 assertions, 0 failures, 7 errors, 0 skips
