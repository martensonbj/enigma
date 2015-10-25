require 'pry'
require_relative 'key'

class Date_Offset

  attr_accessor :date_offset

  def initialize
    @date_offset = date_offset
    @total_offset = total_offset
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

def generate_total_offset

end


end
