class Bid < ActiveRecord::Base
  validate :bid_is_higher_than_the_minimum_bidding_price

  belongs_to :user
  belongs_to :bid_item
  
  validates_associated :user, :bid_item
  
  def bid_is_higher_than_the_minimum_bidding_price
      errors.add(:bid_amount, "can't be lesser than the current permissible minimum bid.") if bid_amount < bid_item.minimum_bidding_price
  end
end
