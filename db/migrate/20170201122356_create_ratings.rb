class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :score
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
