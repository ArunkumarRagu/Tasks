class RenameShopsToStores < ActiveRecord::Migration[7.0]
  def change
    rename_table :shops, :stores
  end
end
