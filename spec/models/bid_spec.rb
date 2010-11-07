require 'spec_helper'

describe Bid do
  
  before(:each) do
    Resque.stub(:enqueue_at)
  end
  
  it "should be able to retrieve the most recent bids overall" do
    10.times do |i|
      Factory(:bid)
    end
    Bid.most_recent(10).count.should == 10
  end
end
