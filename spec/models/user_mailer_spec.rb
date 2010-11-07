require 'spec_helper'

describe UserMailer do
  
  before(:each) do
    Resque.stub(:enqueue_at)
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
end
