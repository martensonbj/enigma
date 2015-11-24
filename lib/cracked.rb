require_relative 'offset'
require_relative 'date_offset'
require_relative 'enigma'
require 'pry'

class Cracked

  attr_accessor :message, :date_offsets,

    def initialize(message, date=nil)
      @message = message
      @date_offsets = Date_Offset.new(date).date_offset
      # @crack_offset = crack_offset_calculator
    end

    def character_range
      ('a'..'z').to_a + ('0'..'9').to_a + ['.', ',', ' ']
    end

    def known_end_of_message
      ["n", "d", ".", "."]
    end

    def known_end_of_message_positions
      known_end_of_message.map do |letter|
        character_range(letter)
      end
    end

    def split_message
      message.split('')
    end

    def target_last_four_characters
      split_message[-4..-1]
    end

    def char_position_of_position_0
      character_range.index(target_last_four_characters[0])
    end

    def get_encrypted_value
      if char_position_of_position_0 < 39
        encrypted_val = char_position_of_position_0 + 39
      else
        encrypted_val = char_position_of_position_0 % 39
      end
      encrypted_val
    end

    def rotation_n
      character_range.index['n']
    end

    def get_key_value_n
      get_encrypted_value - (get_date_value(0)+rotation_n)
    end




  end
