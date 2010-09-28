require 'spec_helper'

describe BidItem do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :body => "value for body"
    }
  end

  it "should create a new instance given valid attributes" do
    BidItem.create!(@valid_attributes)
  end
  
  it "should not save bid item with blank title" do
    item = Factory.build(:bid_item, :title => "")
    item.valid?.should be(false)
  end
end
