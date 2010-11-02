class MailSeller
  @queue = :mail
  def self.perform(bid_item_id)
    item = BidItem.find(bid_item_id)
    if !item.highest_bid.nil?
      UserMailer.deliver_seller_message(item.highest_bid.user, item)
    else
      UserMailer.deliver_seller_not_sold_message(item)
    end
  end
end