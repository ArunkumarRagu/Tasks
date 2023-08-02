class CreatePersonals < ActiveRecord::Migration[7.0]
  def change
    create_table :personals do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.date :dob
      t.string :tenth_mark
      t.string :twelfth_mark
      t.string :school_name
      t.string :college_degree
      t.string :college_name
      t.float :cgpa
      t.string :father_name
      t.string :mother_name
      t.string :father_mobile
      t.string :mother_mobile
      t.string :caste
      t.string :religion
      t.string :username
      t.string :password
      t.string :marital_status
      t.string :instagram_acc
      t.string :twitter_acc
      t.string :facebook_acc
      t.string :gender
      t.string :community

      t.timestamps
    end
  end
end
