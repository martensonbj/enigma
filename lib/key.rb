require 'pry'

class Key

  attr_reader :key_offset
  # RETURNS AN ARRAY OF 4 FIXNUMS

  # BREAK UP INTO MORE METHODS??
  # REWRITE SO USER CAN PROVIDE A KEY

  def initialize(key=nil)
    @key = key
    @key_offset = generate_key
  end

  def generate_key
    if @key == nil
      generate_random_key
    else
      generate_key_offset
    end
  end

  def generate_random_key
    random_key = 5.times.map{ rand(10).to_i }
    random_key.map.with_index do |num, index|
      "#{random_key[index]}#{random_key[index+1]}".to_i unless index == 4
    end.compact
  end

  def generate_key_offset
    key_array = @key.to_s.split('')
    key_array.map! do |num|
      num.to_i
    end
    key_array.map.with_index do |num, index|
      "#{key_array[index]}#{key_array[index+1]}".to_i unless index == 4
    end.compact
  end
end
