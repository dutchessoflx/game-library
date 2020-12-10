class Game < ApplicationRecord
  belongs_to :user, optional: true ### owner
  has_many :loans ## ordernumber
  has_and_belongs_to_many :categories

  def available?
    #1.does the game have any loans at all if not then it must be available
    return true unless loans.any?
    loans.where("TIMESTAMP 'now' >= start_date AND TIMESTAMP 'now' < end_date").empty?
  end

end
