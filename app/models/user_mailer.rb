class UserMailer < ActionMailer::Base
  def winner_message(winner, bid_item)
    recipients  winner.email
    subject     "Congratulations, you have won '#{bid_item.title}'"
    body        :winner => winner, :bid_item => bid_item
    sent_on     Time.now
    content_type "text/html"
    reply_to    "osprey@buzzyand.me"
  end
  def seller_message(winner, bid_item)
    recipients  bid_item.user.email
    subject     "The user '#{winner.email}' has won the bidding on '#{bid_item.title}'"
    body        :winner => winner, :bid_item => bid_item
    sent_on     Time.now
    content_type "text/html"
    reply_to    "osprey@buzzyand.me"
  end
  def seller_not_sold_message(bid_item)
    recipients  bid_item.user.email
    subject     "Sorry, no one bid on '#{bid_item.title}'"
    body        :bid_item => bid_item
    sent_on     Time.now
    content_type "text/html"
    reply_to    "osprey@buzzyand.me"
  end
  def buyer_no_longer_highest_bidder_message(bid_item, buyer)
    recipients  buyer.email
    subject     "Someone outbid you on '#{bid_item.title}'"
    body        :bid_item => bid_item, :buyer => buyer
    sent_on     Time.now
    content_type "text/html"
    reply_to    "osprey@buzzyand.me"
  end
  def bid_item_modification_message(bid_item, message="modified")
    mails = []
    bid_item.bids.each do |b|
      mails << b.user.email
    end
    mails = mails.uniq
    recipients  mails
    subject     "The item you bid on, '#{bid_item.title}', has been #{message}"
    body        :bid_item => bid_item
    sent_on     Time.now
    content_type "text/html"
    reply_to    "osprey@buzzyand.me"
  end
  def bid_item_deletion_message(description, mails)
    recipients  mails
    subject     "An item you bid on has been deleted"
    body        :description => description
    sent_on     Time.now
    content_type "text/html"
    reply_to    "osprey@buzzyand.me"
  end
end
