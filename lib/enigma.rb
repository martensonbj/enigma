require_relative 'offset'
require_relative 'encrypt'
require_relative 'decrypt'
# require_relative 'crack'
require_relative 'date_offset'
require_relative 'key'

class Enigma

  def initialize(user_key=nil, user_date=nil)
    key = Key.new(user_key).key_offset
    date = Date_Offset.new(user_date).date_offset
    offset = Offset.new.generate_total_offset
    @encrypt = Encrypt.new(offset)
    @decrypt = Decrypt.new(offset)
  end

  def encrypt(message, key=nil, date=nil)
    e = @encrypt
    numbers = e.character_index_value(message)
    combined_total =
    e.combine_offset_and_numbers(numbers)
    reduced = e.reduce_numbers(combined_total)
    e.generate_encrypted_message(reduced)
    # e = Enigma.new
    # en = e.encrypt("message", opt-key, opt-date)
  end

  def decrypt(message, key, date=nil)
    e = @decrypt
    numbers = e.character_index_value(message)
    combined_total =
    e.combine_offset_and_numbers(numbers)
    reduced = e.reduce_numbers(combined_total)
    e.generate_decrypted_message(reduced)
    # e.decrypt(output, 12345, Date.today)
    # e.decrypt(output, 12345)
  end

  def crack(message, key=nil, date=nil)
    # e.crack(output, Date.today)
    # e.crack(output)

  end


end
