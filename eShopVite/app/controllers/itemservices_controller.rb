class ItemservicesController < ApplicationController
  # GET /itemservices
  # GET /itemservices.json
  def index
     @current_user = User.find(session[:user_id]) 
     @itemservices = @current_user.itemservice

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @itemservices }
    end
  end

  # GET /itemservices/1
  # GET /itemservices/1.json
  def show
    @itemservice = Itemservice.find(params[:id])
    @itemfriend = @itemservice.Itemfriend
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @itemservice }
    end
  end

  # GET /itemservices/new
  # GET /itemservices/new.json
  def new

   @itemservice = Itemservice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @itemservice }
    end
  end

  # GET /itemservices/1/edit
  def edit
    @itemservice = Itemservice.find(params[:id])
  end

  # POST /itemservices
  # POST /itemservices.json
  def create

   @current_user = User.find(session[:user_id])
   @itemservices = @current_user.itemservice.new(params[:itemservice])

    respond_to do |format|
     if @itemservice.save

        @emailids = @itemservice.emailids.split(';')
        @emailids.each do |emailx|
            MyMailer.shopping_invitation(@itemservice,emailx).deliver
       end

        format.html { redirect_to @itemservice, notice: 'Itemservice was successfully created.' }
        format.json { render json: @itemservice, status: :created, location: @itemservice }
      else
        format.html { render action: "new" }
        format.json { render json: @itemservice.errors, status: :unprocessable_entity }
      end
   end
  end

  # PUT /itemservices/1
  # PUT /itemservices/1.json
  def update
    @itemservice = Itemservice.find(params[:id])

    respond_to do |format|
      if @itemservice.update_attributes(params[:itemservice])
        format.html { redirect_to @itemservice, notice: 'Itemservice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @itemservice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itemservices/1
  # DELETE /itemservices/1.json
  def destroy
    @itemservice = Itemservice.find(params[:id])
    @itemservice.destroy

    respond_to do |format|
      format.html { redirect_to itemservices_url }
      format.json { head :no_content }
    end
  end
end
