class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.integer :user_id
      t.integer :game_id
      t.date :start_date
      t.date :end_date
      t.integer :status

      t.timestamps
    end
  end
end
