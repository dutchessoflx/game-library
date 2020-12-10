class User < ApplicationRecord
  has_many :games
  has_many :loans
  has_secure_password
end
