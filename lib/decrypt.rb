require 'pry'
require_relative 'offset'

class Decrypt

    attr_reader :characters

    def initialize(message, offset)
      @message = message
      @total_offset = Offset.new.generate_total_offset
    end

    def character_range
      ('a'..'z').to_a + (0..9).to_a + ['.', ',', ' ']
    end

    # MAP CHARACTERS TO ASSOCIATED INDEX VALUES
    def generate_numbers_from_message
      @message.split('').map do |letter|
        character_range.find_index(letter)
      end
      # RETURNS AN ARRAY OF FIXNUMS
    end

    def combine_offset_and_numbers
      combined_total = generate_numbers_from_message.map do |num|
        new_value = num - @total_offset[0]
        @total_offset = @total_offset.rotate
        new_value
      end
      combined_total
    end

    # REDUCE ARRAY OF NUMBERS BY 39
    def reduce_numbers
      reduced_array = combine_offset_and_numbers.map do |num|
        num % 39
      end
      reduced_array
    end

    def generate_decrypted_message
      decrypted_message = reduce_numbers.map do |num|
        character_range.values_at(num)
      end
      decrypted_message.join
      binding.pry
    end

end
  message = Decrypt.new("snggfe", @total_offset)
