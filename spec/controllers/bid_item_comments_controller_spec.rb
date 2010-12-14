require 'spec_helper'

describe BidItemCommentsController do
  def mock_bid_item_comment(stubs={})
    @mock_bid_item_comment ||= mock_model(BidItemComment, stubs)
  end
  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end
  def mock_bid_item(stubs={})
    @mock_bid_item ||= mock_model(BidItem, stubs)
  end
  before(:each) do
     request.env['warden'] = mock(Warden, :authenticate => mock_user, :authenticate! => mock_user)
  end
  
  describe "POST create" do
    it "creates new bid item comment with valid args" do
      @bid_item_comment = mock_bid_item_comment(:save => true, :bid_item => mock_bid_item)
      BidItemComment.stub(:new).with({'these' => 'params'}).and_return(@bid_item_comment)
      @bid_item_comment.should_receive(:user=)
      @bid_item_comment.should_receive(:bid_item)
      ability = Ability.new(mock_user)
      ability.can?(:create, mock_bid_item_comment).should be_true
      post :create, :bid_item_comment => {:these => 'params'}
      response.should redirect_to(bid_item_path(@bid_item_comment.bid_item))
    end
    it "creates new bid item comment with invalid args" do
      @bid_item_comment = mock_bid_item_comment(:save => false, :bid_item => mock_bid_item)
      BidItemComment.stub(:new).with({'these' => 'params'}).and_return(@bid_item_comment)
      @bid_item_comment.should_receive(:user=)
      @bid_item_comment.should_receive(:bid_item)
      ability = Ability.new(mock_user)
      ability.can?(:create, mock_bid_item_comment).should be_true
      post :create, :bid_item_comment => {:these => 'params'}
      response.should redirect_to(bid_item_path(@bid_item_comment.bid_item))
    end
  end
  
  describe "DELETE destroy" do
    it "should delete bid item comment" do
      @bid_item_comment = mock_bid_item_comment(:bid_item => mock_bid_item(:user => mock_user))
      BidItemComment.stub(:find).and_return(@bid_item_comment)
      ability = Ability.new(mock_user)
      ability.can?(:destroy, mock_bid_item_comment).should be_true
      @bid_item_comment.should_receive(:destroy)
      delete :destroy, :id => 1
      response.should redirect_to(root_url)
    end
  end
end
