require 'pry'                   # => true
require_relative 'key'          # => true
require_relative 'date_offset'  # => true

class Offset

  def initialize(key, date)
    @key = key
    @date = date
  end                        # => :initialize

  def generate_total_offset
    @key.zip(@date).map { |pair| pair.reduce(&:+)}
  end                                               # => :generate_total_offset

end  # => :generate_total_offset
