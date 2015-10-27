require 'pry'
require_relative 'offset'

class Encrypt

  def initialize(message, offset)
    @message = message
    @total_offset = Offset.new.generate_total_offset
    @characters = ('a'..'z').to_a + (0..9).to_a + ['.', ',', ' ']
  end

  # MAP CHARACTERS TO ASSOCIATED INDEX VALUES
  def generate_character_number
    @message.split('').map do |letter|
      @characters.find_index(letter)
    end
    # RETURNS AN ARRAY OF FIXNUMS
  end

  # ADD CHARACTER NUMBERS TO OFFSET VALUES
  def generate_numbers
    total_char_number = generate_character_number.map do |num|
      a = num + @total_offset[0]
      @total_offset = @total_offset.rotate
      a
    end
    reduce(total_char_number)
  end

  def reduce(total_char_number)
    reduced_array = total_char_number.map do |num|
      num % 39
    end
    generate_message_from_numbers(reduced_array)
  end

  def generate_message_from_numbers(reduced_array)
    encrypted_msg_array = reduced_array.map do |num|
      @characters.values_at(num)
    end
    encrypted_msg_array.join
  end

end

test_final_array = Encrypt.new("hello world", @total_offset).generate_numbers
