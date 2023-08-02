class AddQntyToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :qnty, :integer
  end
end
