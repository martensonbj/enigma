# > e = Enigma.new

require_relative 'offset'
require_relative 'encrypt'
require_relative 'decrypt'
# require_relative 'crack'
require_relative 'date_offset'
require_relative 'key'

class Enigma

  def initialize(message, user_key=nil, user_date=nil)
    key = Key.new(user_key).key_offset
    date = Date_Offset.new(user_date).date_offset
    @offset = Offset.new(key, date).generate_total_offset
    @encrypt = Encrypt.new(message, @offset)
  end

  def encrypt(message, key=nil, date=nil)
    
    # e.encrypt(my_message)
    # e.encrypt(my_message, 12345, Date.today)
  end

  def decrypt(message, key, date=nil)
    # e.decrypt(output, 12345, Date.today)
    # e.decrypt(output, 12345)
  end

  def crack(message, key=nil, date=nil)
    # e.crack(output, Date.today)
    # e.crack(output)

  end


end
