class CreateItemservices < ActiveRecord::Migration
  def change
    create_table :itemservices do |t|
      t.string :siteurl
      t.text :itemdescription
      t.integer :quantity
      t.float :amount
      t.datetime :begindate
      t.datetime :enddate
      t.integer :friendslistid
      t.references :User

      t.timestamps
    end
    add_index :itemservices, :User_id
  end
end
