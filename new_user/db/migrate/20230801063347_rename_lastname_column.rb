class RenameLastnameColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :personals, :last_name, :lastname
    rename_column :personals, :first_name, :firstname
  end
end
