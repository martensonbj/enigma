require 'pry'  # => true

class Date_Offset

  attr_reader :date_offset               # => nil
  #RETURNS AN ARRAY OF 4 FIXNUMS
  def initialize(date=nil)
    @date = date
    @date_offset = generate_date_offset
  end                                    # => :initialize

  def generate_date_offset
    if @date
      date_squared = @date ** 2
      last_four = date_squared.to_s[-4..-1]
      date_offset_array = last_four.split('')
      @date_offset = date_offset_array.map do |num|
        num.to_i
      end
    else
      initial_date = Time.new.strftime("%d%m%y").to_i
      date_squared = initial_date ** 2
      last_four = date_squared.to_s[-4..-1]
      date_offset_array = last_four.split('')
      date_offset_array.map do |num|
        num.to_i
      end
    end
  end                                                  # => :generate_date_offset

end  # => :generate_date_offset
