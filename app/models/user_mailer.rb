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
end
