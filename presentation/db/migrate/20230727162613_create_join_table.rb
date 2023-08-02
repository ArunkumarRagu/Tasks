class CreateJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :aruns, :products do |t|
      t.integer :age
      t.decimal :price, precision: 8, scale: 2
    end
  end
end
