require 'spec_helper'

describe BidItem do

  it "should create a new instance given valid attributes" do
    Factory(:bid_item)
  end
  
  it "should not save bid item with blank title" do
    item = Factory.build(:bid_item, :title => "")
    item.valid?.should be(false)
  end
end
