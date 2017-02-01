class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :category
      t.date :last_visited

      t.timestamps
    end
  end
end
