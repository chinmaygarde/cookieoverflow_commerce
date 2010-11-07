class Bid < ActiveRecord::Base
  validate :bid_is_higher_than_the_minimum_bidding_price, :bid_is_not_placed_on_a_closed_item

  belongs_to :user
  belongs_to :bid_item
  
  validates_associated :user, :bid_item
  
  def bid_is_higher_than_the_minimum_bidding_price
      errors.add(:bid_amount, "can't be lesser than the current permissible minimum bid.") if bid_amount < bid_item.minimum_bidding_price
  end
  
  def bid_is_not_placed_on_a_closed_item
    errors.add(:bid_amount, "is not valid since the bidding has already closed.") if !bid_item.is_open?
  end
  
  def self.most_recent(number=15)
    find(:all, :order => "bid_amount desc", :limit => number)
  end
end
