class MailWinner
  @queue = :mail
  def self.perform(bid_item_id)
    item = BidItem.find(bid_item_id)
    if !item.highest_bid.nil?
      UserMailer.winner_message(item.highest_bid.user, item).deliver
    end
  end
end