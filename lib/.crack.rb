require_relative 'offset'
require_relative 'date_offset'
require_relative 'enigma'
require 'pry'

class Crack

  attr_accessor :message, :date, :crack_offset

    def initialize(message, date=nil)
      @message = message
      @date = Date_Offset.new(date).date_offset
      @crack_offset = crack_offset_calculator
    end

    def character_range
      ('a'..'z').to_a + ('0'..'9').to_a + ['.', ',', ' ']
    end

    def reverse_message
      reversed_message = message.reverse
      reversed_message
    end

    def split_reversed_message
      reverse_message.split('')
    end

    def character_index_value
      split_reversed_message.map do |letter|
        character_range.find_index(letter)
      end
    end

    def target_message
      character_index_value[0..6]
    end

    def character_value_difference
      difference_in_char_rotation = []
      known_message_indexes = [36, 36, 3, 13, 4, 36, 36]
      target_message.each.with_index do |letter, index|
        difference_in_char_rotation << (known_message_indexes[index] - letter)
      end
      difference_in_char_rotation
    end

    def crack_offset_calculator
      character_value_difference[0..3]
    end

    def apply_crack_offset_to_message(crack_offset)
      character_index_value.map do |num|
        new_value = num - crack_offset[0]
        crack_offset = crack_offset.rotate
        new_value
      end
    end

    def modulo_of_new_values(crack_offset)
      rotation = apply_crack_offset_to_message(crack_offset).map do |num|
        num % 39
      end
      rotation
    end

    def crack_message
      modulo_of_new_values(crack_offset).map.with_index do |num|
        character_range[num]
      end.join('')
    end



# key = [31, 14, 49, 99]
# date = [3, 2, 2, 5]
# offset = [34, 16, 51, 104]

#   known character in position 0 is .
#   character to crack in position 0 is message[0]
#   character to cracks index is character_map[message[0]]
#   known character index is character_map.index[.]
#   if character to cracks index < than known cahracters index
#     rotation is character_map.length + (character to cracks index - known chars index)
#   elsif character to cracks index > known chars index
#     rotation = (character to crack - known character index)
#   end
# end


# Date => [3, 2, 2, 5]
# Key => [43, 37, 76, 69]
# Offset => [46, 39, 78, 74]
# e = Encrypt.new(offset)
# => #<Encrypt:0x007fa791149bd8 @offset=[46, 39, 78, 74]>
# e.character_index_value("hi..end..")
# => [7, 8, 36, 36, 4, 13, 3, 36, 36]
# combined_total = e.combine_offset_and_numbers(numbers)
# => [53, 47, 114, 110, 50, 52, 81, 110, 82]
# reduced = e.reduce_numbers(combined_total)
# => [14, 8, 36, 32, 11, 13, 3, 32, 4]
# e.generate_encrypted_message(reduced)
# => "oi.6lnd6e"

  end
