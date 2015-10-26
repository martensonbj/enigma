require 'pry'

class Key

  attr_accessor :key

  def initialize
    @key = Key.new
  end

  def generate_key
    @key = 5.times.map{ rand(10) }
  end



end
