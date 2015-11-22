require_relative 'offset'
require 'pry'

class Crack

  attr_accessor :message

    def initialize(message)
      @message = message
    end

    def character_range
      ('a'..'z').to_a + ('0'..'9').to_a + ['.', ',', ' ']
    end

    def reverse_message
      message.reverse!
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
      test_rotation = []
      target_message_key = [36, 36, 3, 13, 4, 36, 36]
      target_message.each.with_index do |letter, index|
        test_rotation << (target_message_key[index] - letter)
      end
      test_rotation
    end

    def crack_offset
      character_value_difference[0..3]
    end

    # def figure_out_shit
    #   crack_offset.map do |num|
    #     new_value = num - crack_offset[0]
    #     crack_offset = crack_offset.rotate
    #     new_value
    #   end
    # end


  end
