require 'pry'

class Key

  attr_reader :key_offset
  # RETURNS AN ARRAY OF 4 FIXNUMS

  # BREAK UP INTO MORE METHODS??
  # REWRITE SO USER CAN PROVIDE A KEY

  def initialize(key=nil)
    @key_offset = key
  end

  def generate_key_offset
    random_key = 5.times.map{ rand(10).to_i }
    rotated_key_array = random_key.rotate(1)
    combined_key_array = random_key.zip(rotated_key_array)
      @key_offset = combined_key_array.map do |pair|
        pair.join.to_i
      end
    @key_offset.pop
    @key_offset
  end
  @key_offset = Key.new.generate_key_offset
  p @key_offset

end
