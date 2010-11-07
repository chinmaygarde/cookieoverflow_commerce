require 'spec_helper'

describe BidItem do
  
  it "should not save bid item with blank title" do
    item = Factory.build(:bid_item, :title => "")
    item.valid?.should be(false)
  end
  
  it "should retrieve the latest bid items" do
    Resque.stub(:enqueue_at)
    item = Factory(:bid_item, :starting_price => 0, :next_bid_delta => 10)
    20.times do |i|
      Factory(:bid, :bid_item => item, :bid_amount => 20 * (i+1))
    end
    item.latest_bids(5).count.should == 5
  end
end
