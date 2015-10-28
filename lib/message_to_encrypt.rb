require 'pry'
require_relative 'offset'

class MessageToEncrypt

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

  # ADD CHARACTER NUMBERS TO OFFSET VALUES
  def combine_offset_and_numbers
    combined_total = generate_numbers_from_message.map do |num|
      combined_total = num + @total_offset[0]
      @total_offset = @total_offset.rotate
      combined_total
    end
  end

  # REDUCE ARRAY OF NUMBERS BY 39
  def reduce_numbers
    reduced_array = combine_offset_and_numbers.map do |num|
      num % 39
    end
    reduced_array
  end

  # ENCRYPT MESSAGE
  def generate_encrypted_message
    encrypted_message = reduce_numbers.map do |num|
      character_range.values_at(num)
    end
    encrypted_message.join
  end

end
