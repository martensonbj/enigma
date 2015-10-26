require 'pry'

class Date_Offset

  attr_reader :date_offset
  #RETURNS AN ARRAY OF 4 FIXNUMS
  def initialize
    @date_offset = generate_date_offset
  end

  def generate_date_offset
    initial_date = Time.new.strftime("%d%m%y").to_i
    date_squared = initial_date ** 2
    last_four = date_squared.to_s[-4..-1]
    date_offset_string = last_four.split('')
    date_offset_string.map do |num|
      num.to_i
    end
  end

end

Date_Offset.new.date_offset
