class FeedItemsController < ApplicationController
  # GET /feed_items
  # GET /feed_items.json
  def index
    @feed_items = FeedItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feed_items }
    end
  end

  # GET /feed_items/1
  # GET /feed_items/1.json
  def show
    @feed_item = FeedItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feed_item }
    end
  end

  # GET /feed_items/new
  # GET /feed_items/new.json
  def new
    @feed_item = FeedItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feed_item }
    end
  end

  # GET /feed_items/1/edit
  def edit
    @feed_item = FeedItem.find(params[:id])
  end

  # POST /feed_items
  # POST /feed_items.json
  def create
    @feed_item = FeedItem.new(params[:feed_item])

    respond_to do |format|
      if @feed_item.save
        format.html { redirect_to @feed_item, notice: 'Feed item was successfully created.' }
        format.json { render json: @feed_item, status: :created, location: @feed_item }
      else
        format.html { render action: "new" }
        format.json { render json: @feed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feed_items/1
  # PUT /feed_items/1.json
  def update
    @feed_item = FeedItem.find(params[:id])

    respond_to do |format|
      if @feed_item.update_attributes(params[:feed_item])
        format.html { redirect_to @feed_item, notice: 'Feed item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feed_items/1
  # DELETE /feed_items/1.json
  def destroy
    @feed_item = FeedItem.find(params[:id])
    @feed_item.destroy

    respond_to do |format|
      format.html { redirect_to feed_items_url }
      format.json { head :no_content }
    end
  end
end
