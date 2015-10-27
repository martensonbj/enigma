# enigma = Enigma.new(unencrypted_message, key, date)
# encrypted_message = enigma.encrypt

require_relative 'offset'
require_relative 'encrypt'
require_relative 'date_offset'
require_relative 'key'

class Enigma

  def initialize(message, user_key=nil, user_date=nil)
    key = Key.new(user_key).key_offset
    date = Date_Offset.new(user_date).date_offset
    @offset = Offset.new(key, date).generate_total_offset
    @encrypt = Encrypt.new(message, @offset)

  end


end
