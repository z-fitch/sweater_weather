class User < ApplicationRecord

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password, on: :create

  has_secure_password
  
end