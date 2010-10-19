require 'spec_helper'

describe BidItemCommentsController do
  def mock_bid_item_comment(stubs={})
    @mock_bid_item_comment ||= mock_model(BidItemComment, stubs)
  end
  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end
  before(:each) do
     request.env['warden'] = mock(Warden, :authenticate => mock_user, :authenticate! => mock_user)
  end
  describe "POST create" do
#    describe "with valid params" do
#      it "assigns a newly created bid_item_comment as @bid_item_comment" do
#        BidItemComment.stub(:new).with({'these' => 'params'}).and_return(mock_bid_item_comment(:save => true))
#        @bid_item_comment = mock_bid_item_comment
#        @bid_item_comment.should_receive(:user=)
#        @bid_item_comment.should_receive(:bid_item)
#        post :create, :bid_item_comment => {:these => 'params'}
#        #assigns[:bid_item_comment].should equal(mock_bid_item_comment)
#        response.should redirect_to(bid_item_url)
#      end

#      it "redirects to the created bid_item" do
#        BidItem.stub(:new).and_return(mock_bid_item(:save => true))
#        @bid_item = mock_bid_item
#        @bid_item.should_receive(:user=)
#        post :create, :bid_item => {}
#        response.should redirect_to(bid_item_url(mock_bid_item))
#      end
#    end

#    describe "with invalid params" do
#      it "assigns a newly created but unsaved bid_item as @bid_item" do
#        BidItem.stub(:new).with({'these' => 'params'}).and_return(mock_bid_item(:save => false))
#        @bid_item = mock_bid_item
#        @bid_item.should_receive(:user=)
#        post :create, :bid_item => {:these => 'params'}
#        assigns[:bid_item].should equal(mock_bid_item)
#      end
#
#      it "re-renders the 'new' template" do
#        BidItem.stub(:new).and_return(mock_bid_item(:save => false))
#        @bid_item = mock_bid_item
#        @bid_item.should_receive(:user=)
#        post :create, :bid_item => {}
#        response.should render_template('new')
#      end
#    end
#
#  end
#
#  describe "GET 'destroy'" do
#    it "should be successful" do
#      get 'destroy'
#      response.should be_success
#    end
  end
end
