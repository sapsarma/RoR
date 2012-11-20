class Userfriend < ActiveRecord::Base
  belongs_to :User
  attr_accessible :emailaddress, :note
end
