class MyMailer < ActionMailer::Base
  default from: "from@examplea.com"

 def shopping_invitation(itemservices, emailx)
      @itemservice = itemservices
    #  @url = "http://localhost:3000/itemfriends/new/#{@itemservice.friendslistid}?emailid=#{emailx}"
       @emailx = emailx    
       @url = "/itemfriends/new/#{@itemservice.friendslistid}?emailid=#{emailx}"

      mail(:to => emailx, :subject => " ShopVite Invitation from  " )

    end



end
