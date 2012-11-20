class UserMailer < ActionMailer::Base
   default from: "from@example.com"

  def shopping_invitation(itemservice, emailid)
      @itemservice = itemservice
      @url = "http://localhost:3000/itemfriends/new/b9426a62dc210e880ae99aa833d25da08e5afce0?emailid=123"
      mail (:to => emailid, :subject => " ShopVite Invitation from  ")   		
   end
end
