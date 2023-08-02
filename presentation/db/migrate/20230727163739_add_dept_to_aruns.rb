class AddDeptToAruns < ActiveRecord::Migration[7.0]
  def change
    add_column :aruns, :course, :string
  end
end
