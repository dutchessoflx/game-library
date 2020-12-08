class Game < ApplicationRecord
  belongs_to :user, optional: true ### owner
  belongs_to :loan, optional: true ## ordernumber
  has_and_belongs_to_many :categories
end
