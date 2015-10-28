require 'pry'              # => true
require_relative 'offset'  # => true

class Encrypt

    attr_reader :characters  # => nil

    def initialize(offset)
      # @message = message if recomment add message to initialize
      @total_offset = Offset.new.generate_total_offset
    end                                                 # => :initialize

    def character_range
      ('a'..'z').to_a + (0..9).to_a + ['.', ',', ' ']
    end                                                # => :character_range

    # MAP CHARACTERS TO ASSOCIATED INDEX VALUES
    def character_index_value(message)
      message.split('').map do |letter|
        character_range.find_index(letter)
      end
      # RETURNS AN ARRAY OF FIXNUMS
    end                                     # => :character_index_value

    # ADD INDEX VALUE TO OFFSET VALUES
    def combine_offset_and_numbers(character_index_value)
      combined_total = character_index_value.map do |num|
        new_value = num + @total_offset[0]
        @total_offset = @total_offset.rotate
        new_value
      end
      combined_total
    end                                                    # => :combine_offset_and_numbers

    # REDUCE ARRAY OF NUMBERS BY 39
    def reduce_numbers(array)
      reduced_array = array.map do |num|
        num % 39
      end
      reduced_array
    end                                                        # => :reduce_numbers

    # ENCRYPT MESSAGE
    def generate_encrypted_message(reduced)
      encrypted_message = reduced.map do |num|
        character_range.values_at(num)
      end
      encrypted_message.join
    end                                                # => :generate_encrypted_message


# test_final_array = Encrypt.new("hello world", @total_offset).combine_offset_and_numbers

end  # => :generate_encrypted_message
