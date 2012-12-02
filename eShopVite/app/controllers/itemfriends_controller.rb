class ItemfriendsController < ApplicationController
  # GET /itemfriends
  # GET /itemfriends.json
  def index
    @itemfriends = Itemfriend.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @itemfriends }
    end
  end

  # GET /itemfriends/1
  # GET /itemfriends/1.json
  def show
    @itemfriend = Itemfriend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @itemfriend }
    end
  end

  # GET /itemfriends/new
  # GET /itemfriends/new.json
  def new
    @itemfriend = Itemfriend.new
    
    @itemservice = Itemservice.find(:first, :conditions => ["friendslistid = ?", (params[:itemservice_id])])
    @itemfriend.emailid = params[:emailid]
    @itemfriend.itemservice_id = @itemservice.id   


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @itemfriend }
    end
  end

  # GET /itemfriends/1/edit
  def edit
    @itemfriend = Itemfriend.find(params[:id])
  end

  # POST /itemfriends
  # POST /itemfriends.json
  def create
    @itemfriend = Itemfriend.new(params[:itemfriend])

    respond_to do |format|
      if @itemfriend.save
        format.html { redirect_to @itemfriend, notice: 'Itemfriend was successfully created.' }
        format.json { render json: @itemfriend, status: :created, location: @itemfriend }
      else
        format.html { render action: "new" }
        format.json { render json: @itemfriend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /itemfriends/1
  # PUT /itemfriends/1.json
  def update
    @itemfriend = Itemfriend.find(params[:id])

    respond_to do |format|
      if @itemfriend.update_attributes(params[:itemfriend])
        format.html { redirect_to @itemfriend, notice: 'Itemfriend was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @itemfriend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itemfriends/1
  # DELETE /itemfriends/1.json
  def destroy
    @itemfriend = Itemfriend.find(params[:id])
    @itemfriend.destroy

    respond_to do |format|
      format.html { redirect_to itemfriends_url }
      format.json { head :no_content }
    end
  end
end
