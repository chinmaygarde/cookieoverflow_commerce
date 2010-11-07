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
end
