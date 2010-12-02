require 'spec_helper'

describe UserMailer do
  
  before(:each) do
    Resque.stub(:enqueue_at)
    Resque.stub(:enqueue)
    ActionMailer::Base.delivery_method = :test  
    ActionMailer::Base.perform_deliveries = true  
    ActionMailer::Base.deliveries = []
  end
  
  it "should be able to send a mail to the winner of the bid item" do  
    u = Factory(:user)
    bid = Factory(:bid, :bid_item => Factory(:bid_item))
    UserMailer.deliver_winner_message(u, bid.bid_item)
    ActionMailer::Base.deliveries.size.should == 1
  end
  
  it "should be able to send a mail to the seller of the bid item" do  
    u = Factory(:user)
    bid = Factory(:bid, :bid_item => Factory(:bid_item))
    UserMailer.deliver_seller_message(u, bid.bid_item)
    ActionMailer::Base.deliveries.size.should == 1
  end
  
  it "should be able to send a mail to the seller saying that the item was not sold" do  
    b = Factory(:bid_item)
    UserMailer.deliver_seller_not_sold_message(b)
    ActionMailer::Base.deliveries.size.should == 1
  end
  
  it "should be able to send a mail to the buyer if he is no longer the highest bidder" do
    b = Factory(:bid_item)
    u = Factory(:user)
    UserMailer.deliver_buyer_no_longer_highest_bidder_message(b, u)
    ActionMailer::Base.deliveries.size.should == 1
  end
  
  it "should be able to send a message saying that the bid item has been deleted" do
    UserMailer.deliver_bid_item_deletion_message("Foo", "Bar")
    ActionMailer::Base.deliveries.size.should == 1
  end
end
