class NotifyPreviousHighestBidder
  @queue = :mail
  def self.perform(bid_item_id, user_id)
    UserMailer.deliver_buyer_no_longer_highest_bidder_message(BidItem.find(bid_item_id), User.find(user_id))
  end
end