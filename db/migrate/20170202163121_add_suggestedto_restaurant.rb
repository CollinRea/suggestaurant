class AddSuggestedtoRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :suggested, :date, default: Date.new
  end
end
