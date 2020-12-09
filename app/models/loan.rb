class Loan < ApplicationRecord
  belongs_to :game, optional: true
  belongs_to :user
end
