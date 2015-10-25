require 'pry'

class CharSet

  attr_accessor :characters

  def initialize
    @characters = character_set
  end

  def character_set
    @characters = ('a'..'z').to_a + (0..9).to_a + ['.', ',', ' ']
  end

end
