require 'pry'                          # => true
require_relative 'offset'              # => true
require_relative 'message_to_encrypt'  # => true

class Encrypt

  def initialize(message)
    @message = message
  end                      # => :initialize

  def encrypt
    encrypt_message = Encrypt.new("hello").
  end                                       # => :encrypt

# test_final_array = Encrypt.new("hello world", @total_offset).combine_offset_and_numbers

end  # => :encrypt
