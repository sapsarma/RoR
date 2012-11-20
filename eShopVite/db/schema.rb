# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121113055015) do

  create_table "ITEM_FRIENDS", :primary_key => "FRIEND_USERID", :force => true do |t|
    t.string "INTERESTED", :limit => 3
    t.string "QTY",        :limit => 45
    t.string "AMOUNT",     :limit => 45
    t.string "COMMENTS",   :limit => 2000
  end

  create_table "ITEM_SERVICE_INFO", :primary_key => "ITEM_ID", :force => true do |t|
    t.string   "SITE_URL",         :limit => 45
    t.string   "ITEM_DESCRIPTION", :limit => 2000
    t.string   "QUANTITY",         :limit => 45
    t.string   "AMOUNT",           :limit => 45
    t.datetime "BEGIN_DATE"
    t.datetime "END_DATE"
    t.integer  "FRIENDSLSITID"
  end

  create_table "USER_FRIENDS_LIST", :primary_key => "USERID", :force => true do |t|
    t.string "FRIEND_EMAIL_ADDRESS", :limit => 45
    t.string "NOTE",                 :limit => 45
  end

  create_table "USER_INFO", :primary_key => "USERID", :force => true do |t|
    t.string   "FIRST_NAME",   :limit => 45, :null => false
    t.string   "LAST_NAME",    :limit => 45, :null => false
    t.string   "ADDRESS",      :limit => 45
    t.string   "PHONE",        :limit => 45
    t.string   "EMAIL_ID",     :limit => 45
    t.string   "PASSWORD",     :limit => 45, :null => false
    t.string   "DOB",          :limit => 45
    t.datetime "LAST_UDPATED"
  end

  create_table "itemfriends", :force => true do |t|
    t.boolean  "interested"
    t.integer  "qty"
    t.float    "amount"
    t.text     "comments"
    t.integer  "Itemservice_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "emailid"
  end

  add_index "itemfriends", ["Itemservice_id"], :name => "index_itemfriends_on_Itemservice_id"

  create_table "itemservices", :force => true do |t|
    t.string   "siteurl"
    t.text     "itemdescription"
    t.integer  "quantity"
    t.float    "amount"
    t.datetime "begindate"
    t.datetime "enddate"
    t.string   "friendslistid"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "emailids"
    t.text     "emailmessage"
  end

  add_index "itemservices", ["user_id"], :name => "index_itemservices_on_User_id"

  create_table "userfriends", :force => true do |t|
    t.string   "emailaddress"
    t.text     "note"
    t.integer  "User_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "userfriends", ["User_id"], :name => "index_userfriends_on_User_id"

  create_table "users", :force => true do |t|
    t.integer  "userid"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "phone"
    t.string   "emailid"
    t.string   "password"
    t.string   "dob"
    t.string   "sex"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "salt"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

end
