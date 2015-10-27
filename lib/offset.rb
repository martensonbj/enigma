require 'pry'
require_relative 'key'
require_relative 'date_offset'

class Offset

  attr_accessor :total_offset
  # RETURNS AN ARRAY OF 4 FIXNUMS

  def initialize(key, date)
    @total_offset = total_offset
    @key = key
    @date = date
  end

  def generate_total_offset
    @total_offset = @key.zip(@date).map { |pair| pair.reduce(&:+)}
  end

end
