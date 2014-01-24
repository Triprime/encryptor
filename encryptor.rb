class Encryptor  
require 'digest/md5'

  def initialize
    # trying to protect the password "guest" with encryption
    # not working at the moment
    temp = decrypt("(v)t'('", 15)

    # if temp var is working, replace "guest" hard code with temp var  
    @password = "guest"
    password_test
  end

  def encrypt_letter(letter, rotation)
    cipher(rotation)[letter]
  end


  def encrypt(string, rotation)
    letters = string.split ('')

    encrypted_letters = letters.collect do |character|
      encrypt_letter(character, rotation)
    end

    encrypted_letters.join
  end


  # alias_method :decrypt, :encrypt
  def decrypt(string, rotation)
    encrypt(string, -rotation)
  end

  
  def cipher(rotation)
    # key string
    letters = (' '..'z').to_a
    # value string
    rotated_letters = letters.rotate(rotation)

    # zip strings and put in hash
    pairs = letters.zip(rotated_letters) 
    Hash[pairs]
  end

  def encrypt_file (filename, rotation)
    #Create the file handle to the input file
    input = File.open(filename,"r")
    #Read the text of the input file
    content = input.read
    #Encrypt the text
    encrypted_text = encrypt(content, rotation)
    #Create a name for the output file
    output_filename = (filename + ".encrypted")
    #Create an output file handle
    out = File.open(output_filename, "w") 
    #Write out the text
    out.write(encrypted_text)
    #Close the file
    out.close
  end

  def decrypt_file (filename, rotation)
    #Create the file handle to the input file
    input = File.open(filename + ".encrypted","r")
    #Read the text of the input file
    content = input.read
    #Decrypt the text
    decrypted_text = decrypt(content, rotation)
    #Create a name for the output file
    output_filename = (filename + ".decrypted")
    #Create an output file handle
    out = File.open(output_filename, "w") 
    #Write out the text
    out.write(decrypted_text)
    #Close the file
    out.close
  end

  def crack_file(filename)
    input = File.open(filename + ".encrypted","r")
    content = input.read
    cipher(1).count.times do |i|
      puts decrypt(content, i)
    end
  end

  def crack_string(string)
    cipher(1).count.times do |i|
      puts decrypt(string, i)
    end
  end

  def quick_encrypt
    print "Enter rotation amount: "
      rotation = gets.to_i
    puts "Enter text to encrypt below."
      text_to_encrypt = gets

    encrypt(text_to_encrypt, rotation)
  end

    def quick_decrypt
    print "Enter rotation amount: "
      rotation = gets.to_i
    puts "Enter text to decrypt below."
      text_to_encrypt = gets

    decrypt(text_to_encrypt, rotation)
  end

  def test(string)
    output = Digest::MD5.digest(string)
    puts output
  end

  def password_test
    print "Enter password: "
    entry = gets
    entry = entry.chomp
    if @password == entry
      puts "Verified"
    else
      puts "Invalid"
      password_test
    end 
  end

end

instance = Encryptor.new
