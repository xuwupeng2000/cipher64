require "cipher64/version"
require 'openssl'
require 'base64'

module Cipher64
   def self.encrypt(key, data)
    data += 'A' # Add 'A' suffix to support empty data
    cipher(:encrypt, key, data)
  end
   
  def self.decrypt(key, text)
    data = cipher(:decrypt, key, text)
    data[0...-1] # Remove the 'A' suffix
  end
   
  def self.encrypt_base64(key, data)
    blowfish_string = self.encrypt(key, data)
    Base64.encode64(blowfish_string)
  end
   
  def self.decrypt_base64(key, base64_string)
    blowfish_string = Base64.decode64(base64_string)
    self.decrypt(key, blowfish_string)
  end
   
  private
   
  def self.cipher(mode, key, data)
    cipher = OpenSSL::Cipher::Cipher.new('bf-cbc').send(mode)
    cipher.key = Digest::SHA256.digest(key)
    cipher.update(data) << cipher.final
  end
end
