class AddEmailidToItemfriends < ActiveRecord::Migration
  def change
    add_column :itemfriends, :emailid, :string
  end
end
