require 'spec_helper'

describe Tag do
  
  before(:each) do
    Resque.stub(:enqueue_at)
    Resque.stub(:enqueue)
  end
  
  it "should be able to associate bid items with itself" do
    tag = Factory.create(:tag)
    initial_count = tag.bid_items.size
    
    tag.add_bid_item(Factory.create(:bid_item))
    
    tag.bid_items.size.should == initial_count + 1
  end
end
