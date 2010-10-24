class BidItemCommentsController < ApplicationController

  def create
    @bid_item_comment = BidItemComment.new(params[:bid_item_comment])
    @bid_item_comment.user = current_user
    item_id = @bid_item_comment.bid_item.id
    authorize! :create, @bid_item_comment
    if @bid_item_comment.save
      redirect_to(bit_item_path(item_id), :notice => 'BidItem was successfully created.')
    else
      redirect_to(bit_item_path(item_id), :notice => 'Error creating bid item.')
    end
  end

  def destroy
    @bid_item_comment = BidItemComment.find(params[:id])
    authorize! :destroy, @bid_item_comment
    @bid_item_comment.destroy
    redirect_to(@bid_item_comment.bid_item, :notice=>"Comment deleted")
  end
end
