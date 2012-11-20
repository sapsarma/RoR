class FriendslistsController < ApplicationController
  # GET /friendslists
  # GET /friendslists.json
  def index
    @friendslists = Friendslist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @friendslists }
    end
  end

  # GET /friendslists/1
  # GET /friendslists/1.json
  def show
#    @friendslist = Friendslist.find(params[:id])

   

   @friendslist = Array.new 
  # if session["fb_access_token"].present?

    @user = User.find(params[:id])

    graph = Koala::Facebook::GraphAPI.new(session["fb_access_token"])
    @friendslist = graph.get_connections('me', "friends",:fields =>"name,gender,email,relationship_status")
    
#    graph.put_connections("me", "notes", :subject => "eShopVite", :message => "Message from eShopVite to register")


 # if current_user
 #     graph = Koala::Facebook::GraphAPI.new(@token)
 #     @friendslist = graph.get_connections("me", "friends")
 #  end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @friendslist }
    end
  end

  # GET /friendslists/new
  # GET /friendslists/new.json
  def new
    @friendslist = Friendslist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @friendslist }
    end
  end

  # GET /friendslists/1/edit
  def edit
    @friendslist = Friendslist.find(params[:id])
  end

  # POST /friendslists
  # POST /friendslists.json
  def create
    @friendslist = Friendslist.new(params[:friendslist])

    respond_to do |format|
      if @friendslist.save
        format.html { redirect_to @friendslist, notice: 'Friendslist was successfully created.' }
        format.json { render json: @friendslist, status: :created, location: @friendslist }
      else
        format.html { render action: "new" }
        format.json { render json: @friendslist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /friendslists/1
  # PUT /friendslists/1.json
  def update
    @friendslist = Friendslist.find(params[:id])

    respond_to do |format|
      if @friendslist.update_attributes(params[:friendslist])
        format.html { redirect_to @friendslist, notice: 'Friendslist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @friendslist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendslists/1
  # DELETE /friendslists/1.json
  def destroy
    @friendslist = Friendslist.find(params[:id])
    @friendslist.destroy

    respond_to do |format|
      format.html { redirect_to friendslists_url }
      format.json { head :no_content }
    end
  end
end
