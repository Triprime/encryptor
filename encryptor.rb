class Encryptor
  def encrypt_letter(letter)
    lowercase_letter = letter.downcase
    cipher[lowercase_letter]
  end

  def encrypt(string)
    letters = string.split ('')
    
    encrypted_letters = letters.collect do |character|
      encrypt_letter(character)
    end

    encrypted_letters.join


  end


  def cipher
    {'a' => 'n', 'b' => 'o', 'c' => 'p', 'c' => 'q',
     'e' => 'r', 'f' => 's', 'g' => 't', 'h' => 'u',
     'i' => 'v', 'j' => 'w', 'k' => 'x', 'l' => 'y', 
     'm' => 'z', 'n' => 'a', 'o' => 'b', 'p' => 'c',
     'q' => 'd', 'r' => 'e', 's' => 'f', 't' => 'g', 'u'=> 'h', 
     'v' => 'i', 'w' => 'j', 'x' => 'k', 'y' => 'l', 'z'=> 'm' }
  end
end