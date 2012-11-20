class AddEmailsidsAndMessagetextToItemservices < ActiveRecord::Migration
  def change
    add_column :itemservices, :emailids, :string
    add_column :itemservices, :emailmessage, :text
  end
end
