require 'pry'

class Encrypt


  def initialize(total_offset)
    @total_offset = total_offset
  end

  def character_set
    @characters = ('a'..'z').to_a + (0..9).to_a + ['.', ',', ' ']
  end

  # Given a string of letters
  # Given an array of character set
  # For each letter, if it matches a letter in the char set array, print out the index.

  def encrypt(letter)
    cipher(letter)
  end

  def generate_character_number
    string = "string"
    array = ["s", "t", "r", "i", "n", "g"]
    i = 0
    while i < string.length
      new_array = []
      index = array.find_index(string[i])
      new_array << index
      i++
    end

  end





end
