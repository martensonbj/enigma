class Date_Offset

  attr_reader :date_offset

  def initialize(date=nil)
    @date = date
    @date_offset = generate_date_offset
  end

  def generate_date_offset
    if @date
      generate_given_date
    else
      generate_todays_date
    end
  end

  def generate_given_date
    last_four = (@date ** 2).to_s[-4..-1]
    date_offset_array = last_four.split('')
    @date_offset = date_offset_array.map do |num|
      num.to_i
    end
  end

  def generate_todays_date
    initial_date = Time.new.strftime("%d%m%y").to_i
    date_offset_array = ((initial_date ** 2).to_s[-4..-1]).split('')
    date_offset_array.map do |num|
      num.to_i
    end
  end

end
