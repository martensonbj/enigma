require 'pry'              # => true
require_relative 'offset'  # => true

class Encrypt

  def initialize(message, offset)
    @message = message                                             # => "hello world"
    @total_offset = Offset.new.generate_total_offset               # => [51, 20, 91, 96]
    @characters = ('a'..'z').to_a + (0..9).to_a + ['.', ',', ' ']  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, ".", ",", " "]
  end                                                              # => :initialize

  # MAP CHARACTERS TO ASSOCIATED INDEX VALUES
  def generate_character_number
    @message.split('').map do |letter|  # => ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
      @characters.find_index(letter)    # => 7, 4, 11, 11, 14, 38, 22, 14, 17, 11, 3
    end                                 # => [7, 4, 11, 11, 14, 38, 22, 14, 17, 11, 3]
    # RETURNS AN ARRAY OF FIXNUMS
  end                                   # => :generate_character_number

  # ADD CHARACTER NUMBERS TO OFFSET VALUES
  def generate_numbers
    total_char_number = generate_character_number.map do |num|  # => [7, 4, 11, 11, 14, 38, 22, 14, 17, 11, 3]
      a = num + @total_offset[0]                                # => 58, 24, 102, 107, 65, 58, 113, 110, 68, 31, 94
      @total_offset = @total_offset.rotate                      # => [20, 91, 96, 51], [91, 96, 51, 20], [96, 51, 20, 91], [51, 20, 91, 96], [20, 91, 96, 51], [91, 96, 51, 20], [96, 51, 20, 91], [51, 20, 91, 96], [20, 91, 96, 51], [91, 96, 51, 20], [96, 51, 20, 91]
      a                                                         # => 58, 24, 102, 107, 65, 58, 113, 110, 68, 31, 94
    end                                                         # => [58, 24, 102, 107, 65, 58, 113, 110, 68, 31, 94]
    reduce(total_char_number)                                   # => [19, 24, 24, 29, 26, 19, 35, 32, 29, 31, 16]
  end                                                           # => :generate_numbers

  def reduce(total_char_number)
    reduced_array = total_char_number.map do |num|  # => [58, 24, 102, 107, 65, 58, 113, 110, 68, 31, 94]
      num % 39                                      # => 19, 24, 24, 29, 26, 19, 35, 32, 29, 31, 16
    end                                             # => [19, 24, 24, 29, 26, 19, 35, 32, 29, 31, 16]
    reduced_array                                   # => [19, 24, 24, 29, 26, 19, 35, 32, 29, 31, 16]



  end  # => :reduce

end  # => :reduce

test_final_array = Encrypt.new("hello world", @total_offset).generate_numbers  # => [19, 24, 24, 29, 26, 19, 35, 32, 29, 31, 16]
