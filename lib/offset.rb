require 'pry'                   # => true
require_relative 'key'          # => true
require_relative 'date_offset'  # => true

class Offset

  attr_accessor :total_offset  # => nil
  # RETURNS AN ARRAY OF 4 FIXNUMS

  def initialize
    @key = Key.new.generate_key                   # => [28, 82, 28, 89]
    @date = Date_Offset.new.generate_date_offset  # => [0, 2, 2, 5]
    @total_offset = total_offset                  # => nil
  end                                             # => :initialize

  def generate_total_offset
    @total_offset = @key.zip(@date).map { |pair| pair.reduce(&:+)}  # => [28, 84, 30, 94]
  end                                                               # => :generate_total_offset

end  # => :generate_total_offset

__FILE__ == $0                          # => true
off = Offset.new.generate_total_offset  # => [28, 84, 30, 94]
