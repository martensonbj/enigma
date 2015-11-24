gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
   @en = Enigma.new
  end

  def test_there_is_an_encrypt_class
    assert @en.encrypt("hello")
  end

  def test_there_is_a_decrypt_class
    assert @en.decrypt("hello", 12345)
  end

  def test_encrypt_takes_a_message
    assert @en.encrypt('hello')
  end

  def test_encrypt_can_take_a_key_and_a_message
    assert @en.encrypt('hello', 12345)
  end

  def test_encrypt_can_take_a_key_date_and_message
    assert @en.encrypt('hello', 12345, 102215)
  end

  def test_it_encrypts_one_letter
    e = @en.encrypt("x", 12345, 102215)
    assert_equal " ", e
  end

  def test_it_encrypts_multiple_words
    e = @en.encrypt("blake griffin", 45345, 102215)
    assert_equal "k1.vnpd2rvctw", e
  end

  def test_it_encrypts_non_letters
    e = @en.encrypt("abc123,.", 23132, 102215)
    assert_equal "08rzpxn8", e
  end

  def test_decrypt_requires_a_key
    assert_raises ArgumentError do
      @en.decrypt("message")
    end
  end

  def test_decrypt_can_take_a_date_input
    e = @en.decrypt("ninja", 23132, 121185)
    assert_equal "0o,ln", e
  end

  def test_it_decrypts_one_letter
    d = @en.decrypt("9", 12345, 102215)
    assert_equal "u", d
  end

  def test_it_decrypts_a_sentence
    d = @en.decrypt("h1.vkpd2ovctt", 45345, 102215)
    assert_equal "blake griffin", d
  end

  def test_it_decrypts_a_sentence
    d = @en.decrypt("x8rzmxn8", 23132, 102215)
    assert_equal ".bc1z3,.", d
  end

end
