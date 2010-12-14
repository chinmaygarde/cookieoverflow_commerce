class MailSeller
  @queue = :mail
  def self.perform(bid_item_id)
    item = BidItem.find(bid_item_id)
    if !item.highest_bid.nil?
      UserMailer.seller_message(item.highest_bid.user, item).deliver
    else
      UserMailer.seller_not_sold_message(item).deliver
    end
  end
end