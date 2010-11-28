class AutoIncRequestsController < ApplicationController
  before_filter :authenticate_user!
  def create
    auto_inc_req = AutoIncRequest.new(params[:auto_inc_request])
    if auto_inc_req.save
      redirect_to(auto_inc_req.bid_item, :notice => "Automatic bidder was setup")
    else
      redirect_to(auto_inc_req.bid_item, :notice => auto_inc_req.errors.full_messages.first)
    end
  end
  
  def destroy
    auto_inc_req = AutoIncRequest.find(params[:id])
    auto_inc_req.destroy
    redirect_to(auto_inc_req.bid_item, :notice => "Automatic bidder was removed")
  end
end
