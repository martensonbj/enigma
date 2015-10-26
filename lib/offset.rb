require 'pry'                   # => true
require_relative 'key'          # => true
require_relative 'date_offset'  # => true

class Offset

  attr_accessor :total_offset  # => nil
  # RETURNS AN ARRAY OF 4 FIXNUMS

  def initialize
    @total_offset = total_offset  # => nil
  end                             # => :initialize

  def generate_total_offset
    key = Key.new                                             # => nil
    date = @date_offset                                           # => nil
    @total_offset = key.zip(date).map { |pair| pair.reduce(&:+)}  # ~> NoMethodError: undefined method `zip' for nil:NilClass
    @total_offset
  end                                                             # => :generate_total_offset

end  # => :generate_total_offset

offset = Offset.new.generate_total_offset

# ~> NoMethodError
# ~> undefined method `zip' for nil:NilClass
# ~>
# ~> /Users/bmartenson/turing/1module/projects/enigma/lib/offset.rb:17:in `generate_total_offset'
# ~> /Users/bmartenson/turing/1module/projects/enigma/lib/offset.rb:23:in `<main>'
