require 'spec_helper'

describe Bid do
  
  before(:each) do
    Resque.stub(:enqueue_at)
    Resque.stub(:enqueue)
  end
  
  it "should be able to retrieve the most recent bids overall" do
    10.times do |i|
      Factory(:bid)
    end
    Bid.most_recent(10).size.should == 10
  end
  
  it "should be able to automatically place a new bid from the queue" do
    user1 = Factory(:user, :email => "foo@bar.com")
    user2 = Factory(:user, :email => "baz@bar.com")
    
    bid_item = Factory(:bid_item, :starting_price => 100)
    
    Factory(:bid, :bid_item => bid_item, :bid_amount => 200, :user => user1)
    
    req = Factory(:auto_inc_request, :user => user2, :bid_item => bid_item, :maximum_amount => 2000)
    bid_item.highest_bid.user.should == user2
    
    bid_item.stub(:auto_inc_requests).and_return([req])
    
    Factory(:bid, :bid_item => bid_item, :user => user1, :bid_amount => 500)
    bid_item.highest_bid.user.should == user2    
  end
end
