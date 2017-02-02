class AddSuggestedtoRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :suggested, :date
  end
end
