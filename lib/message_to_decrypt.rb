require 'pry'               # => true
require_relative 'offset'   # => true
require_relative 'decrypt'  # => true

class MessageToDecrypt

  attr_reader :characters  # => nil

  def initialize(message, offset)
    @message = message                                # => "snggfe"
    @total_offset = Offset.new.generate_total_offset  # => [53, 32, 6, 49]
  end                                                 # => :initialize

  def character_range
    ('a'..'z').to_a + (0..9).to_a + ['.', ',', ' ']
  end                                                # => :character_range

  # MAP CHARACTERS TO ASSOCIATED INDEX VALUES
  def generate_numbers_from_message
    @message.split('').map do |letter|
      character_range.find_index(letter)
    end
    # RETURNS AN ARRAY OF FIXNUMS
  end                                     # => :generate_numbers_from_message

  def combine_offset_and_numbers
    combined_total = generate_numbers_from_message.map do |num|
      binding.pry
      combined_total = num - @total_offset[0]
      @total_offset = @total_offset.rotate
      combined_total
    end
  end                                                            # => :combine_offset_and_numbers

  # REDUCE ARRAY OF NUMBERS BY 39
  def reduce_numbers
    reduced_array = combine_offset_and_numbers.map do |num|
      num % 39
    end
    reduced_array
  end                                                        # => :reduce_numbers

  def generate_decrypted_message
    decrypted_message = reduce_numbers.map do |num|
      character_range.values_at(num)
    end
    decrypted_message.join
    binding.pry
  end                                                # => :generate_decrypted_message

end  # => :generate_decrypted_message

message = MessageToDecrypt.new("snggfe", @total_offset)  # => #<MessageToDecrypt:0x007ff80b27cf58 @message="snggfe", @total_offset=[53, 32, 6, 49]>
