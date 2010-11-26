class SearchController < ApplicationController
  def bid_item
    data = Array.new
    if !params[:q].nil? && params[:q].length > 2
      bid_items = BidItem.search("*#{params[:q]}*")
      bid_items.each do |item|
        data << {:value => "#{item.id}", :name => "#{item.title}", :image => "#{URI.escape(item.picture.url(:thumb))}"} if !item.nil?
      end
    end
    respond_to do |format|
      format.json { render :json => data}
    end
  end
  
  def user
    data = Array.new
    if !params[:q].nil? && params[:q].length > 2
      users = User.search("*#{params[:q]}*")
      users.each do |user|
        data << {:value => "#{user.id}", :name => "#{user.email}", :image => "#{@template.gravatar(user.email)}?s=40"} if !user.nil?
      end
    end
    respond_to do |format|
      format.json { render :json => data}
    end
  end
end
