require 'pry'                   # => true
require_relative 'key'          # => true
require_relative 'date_offset'  # => true

class Offset

  attr_accessor :total_offset  # => nil
  # RETURNS AN ARRAY OF 4 FIXNUMS

  def initialize(key, date)
    key = Key.new.generate_key_offset
    date = Date_Offset.new.generate_key_offset
    @total_offset = nil
  end                        # => :initialize

  def generate_total_offset(key, date)
    @total_offset = @key_offset.zip(@date_offset).map { |pair| pair.reduce(&:+)}
    @total_offset
  end                                                                             # => :generate_total_offset

end  # => :generate_total_offset

# >> [71, 15, 59, 92]
# >> [0, 2, 2, 5]

message = "tarantula"
key = [a, b, c, d]
key.rotate = [b, c, d, a]
key.rotate = [c, d ,a, b]

message_array = ["a", "b", "c", "d", "e", "f"]
key = [1, 2, 3, 4]

letter_to_number = message_array.map do |letter|
  
end
