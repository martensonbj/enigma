require_relative 'offset'
require_relative 'date_offset'
require_relative 'enigma'

class Cracked

  attr_accessor :message, :date_offsets

    def initialize(message, date=nil)
      @message = message
      @date_offsets = Date_Offset.new(date).date_offset
    end

    def character_range
      ('a'..'z').to_a + ('0'..'9').to_a + ['.', ',', ' ']
    end

    def known_end_of_message
      ["n", "d", ".", "."]
    end

    def known_char_positions
      known_end_of_message.map do |letter|
        character_range.find_index(letter)
      end
    end

    def split_message
      message.split('')
    end

    def message_position_values
      split_message.map do |val|
        character_range.find_index(val)
      end
    end

    def target_last_four_characters
      split_message[-4..-1]
    end

    def unknown_char_positions
      target_last_four_characters.map do |letter|
        character_range.find_index(letter)
      end
    end

    def get_difference_between_indexes
      known_indexes = known_char_positions
      unknown_char_positions.zip(known_char_positions).map do |unknown, known|
        unknown - known
      end
    end

    def calculate_rotations
      get_difference_between_indexes.map do |num|
        num % 39
      end
    end

    def rotation_n
      calculate_rotations[0]
    end

    def rotation_d
      calculate_rotations[1]
    end

    def rotation_dot
      calculate_rotations[2]
    end

    def rotation_dot_two
      calculate_rotations[3]
    end

    def calculate_modulo
      modulo = split_message.count % 4
      modulo
    end

    def find_rotation_from_modulo
      if calculate_modulo == 0
        rotations = calculate_rotations
      elsif calculate_modulo == 1
        rotations = calculate_rotations.rotate(3)
      elsif calculate_modulo == 2
        rotations = calculate_rotations.rotate(2)
      else
        rotations = calculate_rotations.rotate(1)
      end
    end

    def combine_message_index_and_crack_offsets(find_rotation_from_modulo)
      message_position_values.map do |num|
        new_value = num - find_rotation_from_modulo[0]
        find_rotation_from_modulo = find_rotation_from_modulo.rotate
        new_value
      end
    end

    def reduce_numbers
      data = combine_message_index_and_crack_offsets(find_rotation_from_modulo)
      data.map do |num|
        num % 39
      end
    end

    def crack_message
      reduce_numbers.map do |num|
        character_range[num]
      end.join('')
    end

  end
