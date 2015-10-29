require 'pry'
require_relative 'offset'

class Decrypt

    def initialize(offset)
      @offset = offset
    end

    def character_range
      ('a'..'z').to_a + ('0'..'9').to_a + ['.', ',', ' ']
    end

    # MAP CHARACTERS TO ASSOCIATED INDEX VALUES
    def character_index_value(message)
      message.split('').map do |letter|
        character_range.find_index(letter)
      end
      # RETURNS AN ARRAY OF FIXNUMS
    end

    def combine_offset_and_numbers(character_index_value)
      character_index_value.map do |num|
        new_value = num - @offset[0]
        @offset = @offset.rotate
        new_value
      end
    end

    # REDUCE ARRAY OF NUMBERS BY 39
    def reduce_numbers(array)
      reduced_array = array.map do |num|
        num % 39
      end
      reduced_array
    end

    # DECRYPT MESSAGE
    def generate_decrypted_message(reduced)
      decrypted_message = reduced.map do |num|
        character_range.values_at(num)
      end
      decrypted_message.join
    end
end

Decrypt.new([93, 36, 46, 50]).character_index_value("hello")
