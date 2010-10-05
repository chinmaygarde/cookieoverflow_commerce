class BidItemsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET /bid_items
  # GET /bid_items.xml
  def index
    @bid_items = BidItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bid_items }
    end
  end

  # GET /bid_items/1
  # GET /bid_items/1.xml
  def show
    @bid_item = BidItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bid_item }
    end
  end

  # GET /bid_items/new
  # GET /bid_items/new.xml
  def new
    @bid_item = BidItem.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bid_item }
    end
  end

  # GET /bid_items/1/edit
  def edit
    @bid_item = BidItem.find(params[:id])
  end

  # POST /bid_items
  # POST /bid_items.xml
  def create
    @bid_item = BidItem.new(params[:bid_item])
    @bid_item.user = current_user
    respond_to do |format|
      if @bid_item.save
        format.html { redirect_to(@bid_item, :notice => 'BidItem was successfully created.') }
        format.xml  { render :xml => @bid_item, :status => :created, :location => @bid_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bid_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bid_items/1
  # PUT /bid_items/1.xml
  def update
    @bid_item = BidItem.find(params[:id])

    respond_to do |format|
      if @bid_item.update_attributes(params[:bid_item])
        format.html { redirect_to(@bid_item, :notice => 'BidItem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bid_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bid_items/1
  # DELETE /bid_items/1.xml
  def destroy
    @bid_item = BidItem.find(params[:id])
    @bid_item.destroy

    respond_to do |format|
      format.html { redirect_to(bid_items_url) }
      format.xml  { head :ok }
    end
  end
end
