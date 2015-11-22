require_relative 'key'
require_relative 'date_offset'

class Offset

  def initialize(key, date)
    @key = key
    @date = date
  end

  def generate_total_offset
    @key.zip(@date).map { |pair| pair.reduce(&:+)}
  end

end
