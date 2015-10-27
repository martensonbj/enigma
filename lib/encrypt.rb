require 'pry'              # => true
require_relative 'offset'  # => true

class Encrypt

  def initialize(message, offset)                            # ~> ArgumentError: wrong number of arguments (0 for 2)
    @message = message
    @total_offset = offset
    @characters = ('a'..'z').to_a + (0..9).to_a + ['.', ',', ' ']
  end                                                              # => :initialize

  # MAP CHARACTERS TO ASSOCIATED INDEX VALUES
  def generate_character_number
    @message.split('').map do |letter|
      @characters.find_index(letter)
    end
    # RETURNS AN ARRAY OF FIXNUMS
  end                                   # => :generate_character_number

  # ADD CHARACTER NUMBERS TO OFFSET VALUES
  def generate_numbers
    total_char_number = generate_character_number.map do |num|
        num + @total_offset[0]
        @total_offset.rotate
    end
  end                                                           # => :generate_numbers
end                                                             # => :generate_numbers

test_final_array = Encrypt.new("hello world", total_offset).generate_numbers

# ~> ArgumentError
# ~> wrong number of arguments (0 for 2)
# ~>
# ~> /Users/bmartenson/turing/1module/projects/enigma/lib/encrypt.rb:6:in `initialize'
# ~> /Users/bmartenson/turing/1module/projects/enigma/lib/encrypt.rb:29:in `new'
# ~> /Users/bmartenson/turing/1module/projects/enigma/lib/encrypt.rb:29:in `<main>'
