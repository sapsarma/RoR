require 'digest/sha1'
class Itemservice < ActiveRecord::Base
  
  belongs_to :User
  has_many :Itemfriend 
 
 attr_accessible  :user_id, :itemfriend_attributes, :emailids, :emailmessage,  :amount, :begindate, :enddate, :friendslistid, :itemdescription, :quantity, :siteurl, :User
  
before_save :generate_token

def generate_token
  self.friendslistid = Digest::SHA1.hexdigest([Time.now, rand].join)

end



end
