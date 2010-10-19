require 'spec_helper'

describe BidItemComment do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :bid_item_id => 1,
      :body => "value for body"
    }
  end

  it "should create a new instance given valid attributes" do
    BidItemComment.create!(@valid_attributes)
  end
end
