class ChangeColName < ActiveRecord::Migration[7.0]
  def change
    change_column :stores, :name, :integer, options: 'column_modifiers'
  end
end
