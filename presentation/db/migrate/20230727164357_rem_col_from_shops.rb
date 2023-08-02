class RemColFromShops < ActiveRecord::Migration[7.0]
  def change
    remove_column :shops, :price
  end
end
