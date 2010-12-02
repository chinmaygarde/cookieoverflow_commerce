require 'spec_helper'

describe NotifyPreviousHighestBidder do
  def mock_bid(stubs={})
    @mock_tag ||= mock_model(Bid, stubs)
  end
  
  def mock_bid_item(stubs={})
    @mock_bid_item ||= mock_model(BidItem, stubs)
  end

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs)
  end

  def mock_bid(stubs={})
    @mock_tag ||= mock_model(Bid, stubs)
  end

  it "should enqueue the background job to notify the user that he is no longer the highest bidder" do
    BidItem.stub(:find).and_return(mock_bid_item(:title => "something", :body => "else"))
    User.stub(:find).with(1).and_return(mock_user)
    UserMailer.stub(:deliver_buyer_no_longer_highest_bidder_message).with(mock_bid_item, mock_user)
    NotifyPreviousHighestBidder.perform(14, 1)
  end
end