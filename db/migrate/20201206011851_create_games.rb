class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.integer :borrower_id
      t.integer :user_id
      t.integer :min_players
      t.integer :max_players
      t.boolean :available
      t.integer :category_id
      t.string :description
      t.string :contents
      t.string :missing_damage
      t.text :box_art

      t.timestamps
    end
  end
end
