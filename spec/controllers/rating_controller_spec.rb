require 'spec_helper'

describe RatingController do
  def mock_bid_item(stubs={})
    @mock_bid_item ||= mock_model(BidItem, stubs)
  end
  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end
  before(:each) do
     request.env['warden'] = mock(Warden, :authenticate => mock_user, :authenticate! => mock_user)
  end
  
  it "should be able to save a thumbs up rating with valid user" do
    User.stub(:find).and_return(mock_user(:save => true))
    BidItem.stub(:find).and_return(mock_bid_item)
    post 'thumbsup'
  end
  
  it "should be able to save a thumbs down rating with valid user" do
    User.stub(:find).and_return(mock_user(:save => true))
    BidItem.stub(:find).and_return(mock_bid_item)
    post 'thumbsdown'
  end
end
