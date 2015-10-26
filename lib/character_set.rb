require 'pry'  # => true

class Character_Set

  def initialize(total_offset)
    @total_offset = total_offset
  end                             # => :initialize

  def character_set
    @characters = ('a'..'z').to_a + (0..9).to_a + ['.', ',', ' ']
  end                                                              # => :character_set

  def generate_character_number(string=nil)
    message = string
    character_array = @characters
    character_numbers = string.split('').map do |letter|
      @characters.find_index(letter)
    end
    # RETURNS AN ARRAY OF FIXNUMS
  end                                                     # => :generate_character_number

end  # => :generate_character_number
