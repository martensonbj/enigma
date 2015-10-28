# > e = Enigma.new

require_relative 'offset'       # => true
require_relative 'encrypt'      # => true
require_relative 'decrypt'      # => true
# require_relative 'crack'
require_relative 'date_offset'  # => false
require_relative 'key'          # => false

class Enigma

  def initialize(user_key=nil, user_date=nil)
    key = Key.new(user_key).key_offset
    date = Date_Offset.new(user_date).date_offset
    offset = Offset.new.generate_total_offset
    @encrypt = Encrypt.new(offset)
  end                                              # => :initialize

  def encrypt(message, key=nil, date=nil)
    e = @encrypt
    numbers = e.character_index_value(message)
    combined_total =
    e.combine_offset_and_numbers(numbers)
    reduced = e.reduce_numbers(combined_total)
    e.generate_encrypted_message(reduced)


    # e.encrypt(my_message)
    # e.encrypt(my_message, 12345, Date.today)
  end  # => :encrypt

  def decrypt(message, key, date=nil)
    # e.decrypt(output, 12345, Date.today)
    # e.decrypt(output, 12345)
  end                                  # => :decrypt

  def crack(message, key=nil, date=nil)
    # e.crack(output, Date.today)
    # e.crack(output)

  end  # => :crack


end  # => :crack
