class CreateBorrowers < ActiveRecord::Migration[5.2]
  def change
    create_table :borrowers do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :contact_details
      t.integer :user_id

      t.timestamps
    end
  end
end
