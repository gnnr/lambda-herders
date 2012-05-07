class FeedItemsController < ApplicationController
  
  def new
    @feed_item = FeedItem.new
  end
  # GET /feed_items
  # GET /feed_items.json
  def index
    feed_items = FeedItem.all
    @feed_items = []

    feed_items.each do |feed_item|
      @feed_items << {:text => feed_item["text"],
                      :category => feed_item["category"]}
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feed_items }
    end
  end

  # GET /feed_items/1
  # GET /feed_items/1.json
  def show
    item = FeedItem.find(params[:id])
    @feed_item = { :message => item.message, :category => item.category } 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feed_item }
    end
  end

  # POST /feed_items
  # POST /feed_items.json
  def create
    puts params[:feed_item][:token]
    token = Token.where(:token => params[:feed_item][:token]).first
     
    unless token
      return render :text => "No token was found, here's the deserialized object created on the backend #{params}"
    end
    
    @message = params[:feed_item][:message]
    @category = params[:feed_item][:category] 
    
    @feed_item = FeedItem.new(:text => @message, :category => @category)
    @feed_item.token = token

    if @feed_item.save
      return render :text => @feed_item
    end

    return
  end


  # DELETE /feed_items/1
  # DELETE /feed_items/1.json
  def destroy
    @feed_item = FeedItem.find(params[:id])

    if @feed_item.token == params[:token] 
      @feed_item.destroy
    end

    respond_to do |format|
      format.html { redirect_to feed_items_url }
      format.json { head :no_content }
    end
  end
end
