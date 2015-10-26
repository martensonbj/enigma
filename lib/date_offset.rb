require 'pry'  # => true

class Date_Offset

  attr_reader :date_offset  # => nil
  #RETURNS AN ARRAY OF 4 FIXNUMS

  def initialize
    @date_offset = nil  # => nil
  end                   # => :initialize

def generate_date_offset
  initial_date = Time.new.strftime("%d%m%y").to_i    # => 251015
  date_squared = initial_date ** 2                   # => 63008530225
  last_four = date_squared.to_s[-4..-1]              # => "0225"
  date_offset_string = last_four.split('')           # => ["0", "2", "2", "5"]
    @date_offset = date_offset_string.map do |num|   # => ["0", "2", "2", "5"]
      num.to_i                                       # => 0, 2, 2, 5
    end                                              # => [0, 2, 2, 5]
    @date_offset                                     # => [0, 2, 2, 5]
end                                                  # => :generate_date_offset
@date_offset = Date_Offset.new.generate_date_offset  # => [0, 2, 2, 5]
p @date_offset                                       # => [0, 2, 2, 5]

end  # => [0, 2, 2, 5]

# >> [0, 2, 2, 5]
