class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :door_number
      t.string :floor_number
      t.string :building_name
      t.string :street_name
      t.string :area
      t.string :village
      t.string :town
      t.string :city
      t.string :pincode
      t.string :landmark
      t.string :district
      t.string :state
      t.string :country
      t.string :address_type

      t.timestamps
    end
  end
end
