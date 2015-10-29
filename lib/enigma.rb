require 'pry'
require_relative 'offset'
require_relative 'encrypt'
require_relative 'decrypt'
require_relative 'date_offset'
require_relative 'key'

class Enigma

  def initialize
  end

  def encrypt(message, key=nil, date=nil)
    key = Key.new(key).key_offset
    date = Date_Offset.new.date_offset
    offset = Offset.new(key, date).generate_total_offset
    e = Encrypt.new(offset)
    numbers = e.character_index_value(message)
    combined_total = e.combine_offset_and_numbers(numbers)
    reduced = e.reduce_numbers(combined_total)
    e.generate_encrypted_message(reduced)
  end

  def decrypt(message, key, date=nil)
    key = Key.new(key).key_offset
    date = Date_Offset.new.date_offset
    offset = Offset.new(key, date).generate_total_offset
    e = Decrypt.new(offset)
    numbers = e.character_index_value(message)
    combined_total = e.combine_offset_and_numbers(numbers)
    reduced = e.reduce_numbers(combined_total)
    e.generate_decrypted_message(reduced)
  end

  def crack(message, key=nil, date=nil)
    # e.crack(output, Date.today)
    # e.crack(output)
  end


end

# e = Enigma.new.encrypt("hello", 93445)  # => [7, 4, 11, 11, 14]
# e = Enigma.new.encrypt("hello", 93445) # => [100, 40, 57, 61, 107]
# e = Enigma.new.encrypt("hello", 93445) # => [22, 1, 18, 22, 29]
e = Enigma.new.encrypt("hello", 93445)
# e = Enigma.new.encrypt("hello", 93445) # => "wbsw3"
d = Enigma.new.decrypt("wbsw3", 93445)
