class User < ApplicationRecord
  has_many :games
  has_many :borrowers
  has_secure_password



end
