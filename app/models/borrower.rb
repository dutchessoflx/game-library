class Borrower < ApplicationRecord
  belongs_to :games, optional:true
  belongs_to :user, optional: true
end
