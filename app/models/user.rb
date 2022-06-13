class User < ApplicationRecord
  validates_uniqueness_of :email, :password
  validates_presence_of :password_confirmation, :api_key
end
