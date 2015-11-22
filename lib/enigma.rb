require_relative 'offset'
require_relative 'encrypt'
require_relative 'decrypt'
require_relative 'crack'
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

  def crack(message)
    key = Key.new(key).key_offset
    date = Date_Offset.new.date_offset
    offset = Offset.new(key, date).generate_total_offset
    e = Crack.new(message)
    numbers = e.character_index_value(message)
    combined_total = e.combine_offset_and_numbers(numbers)
    reduced = e.reduce_numbers(combined_total)
    e.generate_decrypted_message(reduced)
  end

end
