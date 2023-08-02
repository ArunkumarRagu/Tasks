class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
