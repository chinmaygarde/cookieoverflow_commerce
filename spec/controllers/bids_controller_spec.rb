require 'spec_helper'

describe BidsController do
  def mock_bid(stubs={})
    @mock_tag ||= mock_model(Bid, stubs)
  end
  def mock_bid_item(stubs={})
    @mock_bid_item ||= mock_model(BidItem, stubs)
  end
  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end
  before(:each) do
     request.env['warden'] = mock(Warden, :authenticate => mock_user, :authenticate! => mock_user)
  end
  
  describe "POST 'create'" do
    it "should create a new bid with valid arguments" do
      Bid.stub(:new).and_return(mock_bid({:bid_item => mock_bid_item(:user => mock_user), :save => true}))
      @bid = mock_bid
      BidItem.stub(:find).and_return(mock_bid_item)
      @bid.should_receive(:bid_item=)
      @bid.should_receive(:user=)
      
      ability = Ability.new(mock_user)
      ability.can?(:create, mock_bid).should be_true
      
      get :create
      response.should redirect_to(bid_item_path(mock_bid_item(:user => mock_user)))
    end
    it "should create a new bid with invalid arguments" do
      Bid.stub(:new).and_return(mock_bid({:bid_item => mock_bid_item(:user => mock_user), :save => false}))
      @bid = mock_bid
      BidItem.stub(:find).and_return(mock_bid_item)
      @bid.should_receive(:bid_item=)
      @bid.should_receive(:user=)
      
      ability = Ability.new(mock_user)
      ability.can?(:create, mock_bid).should be_true
      
      get :create
      response.should redirect_to(bid_item_path(mock_bid_item(:user => mock_user)))
    end
  end

  describe "DELETE 'destroy'" do
    it "should be successful" do
      @bid = mock_bid(:bid_item => mock_bid_item, :user => mock_user)
      Bid.stub(:find).and_return(@bid)
      ability = Ability.new(mock_user)
      @bid.should_receive(:destroy)
      ability.can?(:destroy, @bid).should be_true
      delete :destroy, :id => 1
      response.should redirect_to(bid_item_path(@bid.bid_item))
    end
  end
end
