Shoes.setup do
  require './lib/enigma'
end

Shoes.app(width: 500,
          height: 500) do
  background ("#000".."#ffa500")
  border("#ffa500".."#000",
          strokewidth: 6)

  stack(top: 10){
    title("Enigma",
            align: "center",
            font: "Trebuchet MS",
            stroke: "#ff6500")
  }
  stack(margin: 30){
    flow{
      @title = para "Enter A String to Encrypt:", margin_right: 15, font: "Trebuchet MS", stroke: white
      @input = edit_line width: 150
    }
    flow{
      @key_title = para "Enter A Key:", margin_right: 110, font: "Trebuchet MS", stroke: white
      @key_input = edit_line width: 150
    }
    @encrypt_me = button "Encrypt"
    @encrypted_str = para ""
  }

  stack(margin: 30) {
    flow{
      @decrypt_title = para "Enter A String to Decrypt:", margin_right: 15, font: "Trebuchet MS", stroke: white
      @decrypt_input = edit_line width: 150
    }
    @decrypt_me = button "Decrypt"
    @decrypted_str = para ""
  }

  @encrypt_me.click {
    if @key_input.text == ''
      @key = 12345
    else
      @key = @key_input.text
    end

    @str = e.encrypt(@input.text.downcase, @key)
    @encrypted_str.replace "Current encrypted string: #{@str}"
    @decrypt_input.text = @str
  }

  @decrypt_me.click {
    @dec_str = e.decrypt(@decrypt_input.text.downcase, @key)
    @decrypted_str.replace "Original String: #{@dec_str}"
  }

end

e = Enigma.new
