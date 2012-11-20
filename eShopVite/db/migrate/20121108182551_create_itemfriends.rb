class CreateItemfriends < ActiveRecord::Migration
  def change
    create_table :itemfriends do |t|
      t.boolean :interested
      t.integer :qty
      t.float :amount
      t.text :comments
      t.references :Itemservice

      t.timestamps
    end
    add_index :itemfriends, :Itemservice_id
  end
end
