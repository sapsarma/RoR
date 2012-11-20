class Itemfriend < ActiveRecord::Base
  belongs_to :Itemservice
  attr_accessible :Itemservice_id, :amount, :comments, :interested, :qty, :emailid

end
