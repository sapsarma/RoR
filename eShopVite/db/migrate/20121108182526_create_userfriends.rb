class CreateUserfriends < ActiveRecord::Migration
  def change
    create_table :userfriends do |t|
      t.string :emailaddress
      t.text :note
      t.references :User

      t.timestamps
    end
    add_index :userfriends, :User_id
  end
end
