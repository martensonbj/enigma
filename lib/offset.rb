require 'pry'

class Offset

  attr_accessor :total_offset, :key, :date_offset

  def initialize
    @random_key = random_key
    @key_offset = key_offset
    @date_offset = date_offset
    @total_offset = total_offset
  end

  def generate_key
    @random_key = 5.times.map{ rand(10)to_i }
    # RETURNS AN ARRAY OF 5 FIXNUMS
  end

  def generate_key_offset()
    rotated_key_array = @random_key.rotate(1)
    combined_key_array = @random_key.zip(rotated_key_array)
    key_offset = combined_key_array.map do |pair|
      pair.join.to_i
    end
    key_offset.pop
    @key_offset
    end
    # RETURNS AN ARRAY OF 4 FIXNUMS
  end

  def generate_date_offset
    d = Time.new
    initial_date = d.strftime("%d%m%y").to_i
    date_squared = initial_date ** 2
    last_four = date_squared.to_s[-4..-1]
    date_offset_string = last_four.split('')
      @date_offset = date_offset_string.map do |num|
        num.to_i
        #RETURNS AN ARRAY OF 4 FIXNUMS
      end
  end

  def generate_total_offset
    @total_offset = @key_offset.zip(@date_offset).map{|pair| pair.reduce(&:+) }
    # RETURNS AN ARRAY OF 4 FIXNUMS
  end



end
