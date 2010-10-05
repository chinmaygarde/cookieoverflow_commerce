require 'spec_helper'

describe BidItemsController do

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end

  def mock_bid_item(stubs={})
    @mock_bid_item ||= mock_model(BidItem, stubs)
  end

  describe "GET index" do
    it "assigns all bid_items as @bid_items" do
      BidItem.stub(:find).with(:all).and_return([mock_bid_item])
      get :index
      assigns[:bid_items].should == [mock_bid_item]
    end
  end

  describe "GET show" do
    it "assigns the requested bid_item as @bid_item" do
      BidItem.stub(:find).with("37").and_return(mock_bid_item)
      get :show, :id => "37"
      assigns[:bid_item].should equal(mock_bid_item)
    end
  end

  describe "GET new" do
    before(:each) do
       request.env['warden'] = mock(Warden, :authenticate => mock_user, :authenticate! => mock_user)
    end
    it "assigns a new bid_item as @bid_item" do
      BidItem.stub(:new).and_return(mock_bid_item)
      get :new
      assigns[:bid_item].should equal(mock_bid_item)
    end
  end

  describe "GET edit" do
    before(:each) do
       request.env['warden'] = mock(Warden, :authenticate => mock_user, :authenticate! => mock_user)
    end
    it "assigns the requested bid_item as @bid_item" do
      BidItem.stub(:find).with("37").and_return(mock_bid_item)
      get :edit, :id => "37"
      assigns[:bid_item].should equal(mock_bid_item)
    end
  end

  describe "POST create" do
    before(:each) do
       request.env['warden'] = mock(Warden, :authenticate => mock_user, :authenticate! => mock_user)
    end
    describe "with valid params" do
      it "assigns a newly created bid_item as @bid_item" do
        BidItem.stub(:new).with({'these' => 'params'}).and_return(mock_bid_item(:save => true))
        @bid_item = mock_bid_item
        @bid_item.should_receive(:user=)
        post :create, :bid_item => {:these => 'params'}
        assigns[:bid_item].should equal(mock_bid_item)
      end
      
      it "redirects to the created bid_item" do
        BidItem.stub(:new).and_return(mock_bid_item(:save => true))
        @bid_item = mock_bid_item
        @bid_item.should_receive(:user=)
        post :create, :bid_item => {}
        response.should redirect_to(bid_item_url(mock_bid_item))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bid_item as @bid_item" do
        BidItem.stub(:new).with({'these' => 'params'}).and_return(mock_bid_item(:save => false))
        @bid_item = mock_bid_item
        @bid_item.should_receive(:user=)
        post :create, :bid_item => {:these => 'params'}
        assigns[:bid_item].should equal(mock_bid_item)
      end

      it "re-renders the 'new' template" do
        BidItem.stub(:new).and_return(mock_bid_item(:save => false))
        @bid_item = mock_bid_item
        @bid_item.should_receive(:user=)
        post :create, :bid_item => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do
    before(:each) do
       request.env['warden'] = mock(Warden, :authenticate => mock_user, :authenticate! => mock_user)
    end
    describe "with valid params" do
      it "updates the requested bid_item" do
        BidItem.should_receive(:find).with("37").and_return(mock_bid_item)
        mock_bid_item.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :bid_item => {:these => 'params'}
      end

      it "assigns the requested bid_item as @bid_item" do
        BidItem.stub(:find).and_return(mock_bid_item(:update_attributes => true))
        put :update, :id => "1"
        assigns[:bid_item].should equal(mock_bid_item)
      end

      it "redirects to the bid_item" do
        BidItem.stub(:find).and_return(mock_bid_item(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(bid_item_url(mock_bid_item))
      end
    end

    describe "with invalid params" do
      it "updates the requested bid_item" do
        BidItem.should_receive(:find).with("37").and_return(mock_bid_item)
        mock_bid_item.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :bid_item => {:these => 'params'}
      end

      it "assigns the bid_item as @bid_item" do
        BidItem.stub(:find).and_return(mock_bid_item(:update_attributes => false))
        put :update, :id => "1"
        assigns[:bid_item].should equal(mock_bid_item)
      end

      it "re-renders the 'edit' template" do
        BidItem.stub(:find).and_return(mock_bid_item(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    before(:each) do
       request.env['warden'] = mock(Warden, :authenticate => mock_user, :authenticate! => mock_user)
    end
    it "destroys the requested bid_item" do
      BidItem.should_receive(:find).with("37").and_return(mock_bid_item)
      mock_bid_item.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the bid_items list" do
      BidItem.stub(:find).and_return(mock_bid_item(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(bid_items_url)
    end
  end

end
