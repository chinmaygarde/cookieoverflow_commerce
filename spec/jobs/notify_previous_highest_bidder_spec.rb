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
    user = mock_user(:email => "foo@bar.com")
    bid_item = BidItem.stub(:find).and_return(mock_bid_item(:title => "something", :body => "else", :end_time => 10.days.from_now))
    User.stub(:find).with(1).and_return(user)
    UserMailer.stub(:deliver_buyer_no_longer_highest_bidder_message).with(bid_item, user)
    NotifyPreviousHighestBidder.perform(14, 1)
  end
end