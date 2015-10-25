require 'pry'

class Key

  attr_accessor :key

  def initialize
    @key = Key.new
  end

  def generate_key
    key_bucket = []
    5.times do
      key_bucket << rand(10)
    end
    @key = key_bucket.join

  end
  #
  # @key = Key.new.generate_key
  # puts @key


end
