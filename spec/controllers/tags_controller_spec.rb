require 'spec_helper'

describe TagsController do
  def mock_tag(stubs={})
    @mock_tag ||= mock_model(Tag, stubs)
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
    it "create a new tag if arguments valid" do
      Tag.stub(:new).and_return(mock_tag({:bid_item => mock_bid_item(:user => :user), :save => true}))
      @tag = mock_tag
      @tag.should_receive(:title=)
      BidItem.stub(:find).and_return(mock_bid_item)
      @tag.should_receive(:add_bid_item).with(mock_bid_item)
      ability = Ability.new(mock_user)
      ability.can?(:create, mock_tag).should be_true
      post :create, :tag => {:these => 'params'}
      assigns[:tag].should equal(mock_tag)
    end
    it "create a new tag if arguments invalid" do
      Tag.stub(:new).and_return(mock_tag({:bid_item => mock_bid_item(:user => :user), :save => false}))
      @tag = mock_tag
      @tag.should_receive(:title=)
      BidItem.stub(:find).and_return(mock_bid_item)
      @tag.should_receive(:add_bid_item).with(mock_bid_item)
      ability = Ability.new(mock_user)
      ability.can?(:create, mock_tag).should be_true
      post :create, :tag => {:these => 'params'}
      response.should redirect_to(bid_item_url(mock_bid_item))
    end
    
  end
  
  describe "DELETE 'destroy'" do
    it "should be successful" do
      Tag.stub(:find).and_return(mock_tag({:bid_item => mock_bid_item(:user => mock_user)}))
      ability = Ability.new(mock_user)
      ability.can?(:destroy, mock_tag).should be_true
      mock_tag.should_receive(:destroy).with(no_args)
      delete 'destroy', :id => 1
      response.should redirect_to(root_url)
    end
  end
end
