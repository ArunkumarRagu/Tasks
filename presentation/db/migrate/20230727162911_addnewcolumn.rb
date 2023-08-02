class Addnewcolumn < ActiveRecord::Migration[7.0]
    def change
      add_column :aruns, :dept, :string
    end
end
