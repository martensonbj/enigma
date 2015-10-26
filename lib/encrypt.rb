require 'pry'
require_relative 'offset'

class Encrypt

  def initialize(message, total_offset)
    @message = "hello world" #gets.chomp
    @total_offset = [12, 23, 34, 45]
  end

  # DEFINE SET OF CHARACTERS
  def character_set
    @characters = ('a'..'z').to_a + (0..9).to_a + ['.', ',', ' ']
  end

  # MAP CHARACTERS TO ASSOCIATED INDEX VALUES
  def generate_character_number(string=nil)
    message = string
    character_array = @characters
    character_numbers = string.split('').map do |letter|
      @characters.find_index(letter)
    end
    # RETURNS AN ARRAY OF FIXNUMS
  end

  # ADD CHARACTER NUMBERS TO OFFSET VALUES
  # def generate_numbers
  # numbers_array = [10, 10, 10, 10, 10, 10]
  # total_offset = [1, 2, 3, 4]
  #   total_char_number = numbers_array.map do |num|
  #       num + total_offset[0]
  #       total_offset.rotate
  #       binding.pry
  #   end
  # end

  def generate_numbers
    numbers_array = [10, 10, 10, 10, 10, 10]
    chunks = numbers_array.each_slice(4).to_a


  end

end
