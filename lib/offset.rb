require 'pry'
require_relative 'key'

class Offset

  attr_accessor :final_offset, :key, :date

  def initialize
    @key = key
    @date = date
    @final_offset = final_offset
  end

  def generate_key
    key_bucket = []
    5.times do
      key_bucket << rand(10)
    end
    @key = key_bucket.join
  end

  def generate_key_offset()
    key_array = @key.split('')
    rotated_array = key_array.rotate(1)
    combined_array = key_array.zip(rotated_array)
    flattened_array = combined_array.map do |pair|
      pair.join
    end
    flattened_array.pop
    return flattened_array
  end

  def generate_date_offset
    d = Time.new
    date = d.strftime("%d%m%y").to_i
    date_squared = date ** 2
    last_four = date_squared.to_s[-4..-1]
    date_offset_string = last_four.split('')
      date_offset = date_offset_string.map do |num|
        num.to_i
      end
  end



end


# KEY: get key from key class
# For the key, iterate through.
# concat i + i+1
# i++
#
# 0+1
# 1+2
# 2+3
# 3+4
