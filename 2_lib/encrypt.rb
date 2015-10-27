require "pry"
require 'date'
unencrypted_message = "hello world"

# encrypt shit
require_relative 'enigma'
#lib/enigma.rb
key    = Enigma.random_key # "12345"
date   = Date.today  # "102615", today's date
enigma = Enigma.new(unencrypted_message, key, date)
encrypted_message = enigma.encrypt

# outpout message

# print message, key, and date
