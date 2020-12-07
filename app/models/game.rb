class Game < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :borrower, optional: true
  has_and_belongs_to_many :categories
end
