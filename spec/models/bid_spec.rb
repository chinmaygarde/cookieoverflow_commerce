require 'spec_helper'

describe Bid do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :bid_item_id => 1,
      :bid_amount => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Bid.create!(@valid_attributes)
  end
end
