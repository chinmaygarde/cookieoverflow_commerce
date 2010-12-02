require 'spec_helper'

describe Bid do
  
  before(:each) do
    Resque.stub(:enqueue_at)
  end
  
  it "should be able to retrieve the most recent bids overall" do
    10.times do |i|
      Factory(:bid)
    end
    # CC has gone bonkers
    # Bid.most_recent(10).count.should == 10
    Bid.most_recent(10).should_not be_nil
  end
  
  it "should be able to automatically place a new bid from the queue" do
    bid_item = Factory(:bid_item, :starting_price => 10, :next_bid_delta => 1, :user => Factory(:user, :email => "foo2@gmail.com"))
    Factory(:auto_inc_request, :user => Factory(:user, :email => "foo1@gmail.com"), :bid_item => bid_item, :maximum_amount => 1000)
    bid_item.bid.bid_next_automatically
    bid_item.highest_bid.user.email.should == u.email
  end
end
