class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :userid
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :phone
      t.string :emailid
      t.string :password
      t.string :dob
      t.string :sex

      t.timestamps
    end
  end
end
