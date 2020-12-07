class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :borrower_id
      t.string :contact
      t.string :borrower_history
      t.boolean :admin

      t.timestamps
    end
  end
end
