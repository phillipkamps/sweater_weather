class User < ApplicationRecord
  validates_uniqueness_of :email
  validates_presence_of :api_key, :password, :password_confirmation

  has_secure_password
end
