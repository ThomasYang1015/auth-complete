# to encrypt a secret, use BCrypt::Password.create(secret)
# to test a secret, use BCrypt::Password.new(encrypted) == secret
# run this file using rails runner scripts/encryption.rb

# TODO:
# 1. encrypt a secret and puts encrypted string
secret = "tacos"
puts secret
encrypted_string = BCrypt::Password.create(secret)
puts encrypted_string
# 2. prepare encrypted string for testing
# 3. test secret against prepared encrypted string
user_entered_secret = "tacos"
result = BCrypt::Password.new(encrypted_string) == user_entered_secret
puts result