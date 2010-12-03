require 'spec_helper'

describe BidItem do
  
  before(:each) do
    Resque.stub(:enqueue_at)    
    Resque.stub(:enqueue)
  end
  
  it "should not save bid item with blank title" do
    item = Factory.build(:bid_item, :title => "")
    item.valid?.should be(false)
  end
  
  it "should retrieve the latest bid items" do
    item = Factory(:bid_item, :starting_price => 0, :next_bid_delta => 10)
    20.times do |i|
      Factory(:bid, :bid_item => item, :bid_amount => 20 * (i+1))
    end
    item.latest_bids(5).size.should == 5
  end
  
  it "should be able to notify bidders of deletion" do
    item = Factory(:bid_item)
    item.notify_bidders_of_deletion
  end
end
