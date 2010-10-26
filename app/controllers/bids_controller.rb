class BidsController < ApplicationController
  def create
    @bid = Bid.new
    @bid.bid_amount = params[:bid_amount]
    bid_item = BidItem.find(params[:bid_item_id])
    @bid.bid_item = bid_item
    @bid.user = current_user
    authorize! :create, @bid
    if @bid.save
      redirect_to(@bid.bid_item, :notice => 'Bid was successfully created.')
    else
      redirect_to(@bid.bid_item, :notice => 'Error creating bid.')
    end
  end

  def destroy
    @bid = Bid.find(params[:id])
    authorize! :destroy, @bid
    @bid.destroy
    redirect_to(@bid.bid_item, :notice=>"Comment deleted")
  end
end
