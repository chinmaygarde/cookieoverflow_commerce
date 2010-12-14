require 'spec_helper'

describe AutoIncRequestsController do
  
  def mock_bid_item(stubs={})
    @mock_bid_item ||= mock_model(BidItem, stubs)
  end
    
  def mock_auto_inc_request(stubs={})
    @mock_auto_inc_request ||= mock_model(AutoIncRequest, stubs)
  end
  
  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end
  
  before(:each) do
     request.env['warden'] = mock(Warden, :authenticate => mock_user, :authenticate! => mock_user)
  end
  

  it "should use AutoIncRequestsController" do
    controller.should be_an_instance_of(AutoIncRequestsController)
  end
  
  it "should be able to create a new handler with valid params" do
    AutoIncRequest.stub(:new).and_return(mock_auto_inc_request(:bid_item => mock_bid_item, :save => true, :full_messages => {:first => "Foo"}))
    post 'create'
  end
  
  it "should not be able to create a new handler with invalid params" do
    req = mock_auto_inc_request(:bid_item => mock_bid_item, :save => false)
    AutoIncRequest.stub(:new).and_return(req)
    req.errors.should_receive(:full_messages).and_return([])
    post 'create'
  end
  
  it "should be able to delete a handler" do
    auto_inc_request = mock_auto_inc_request(:bid_item => mock_bid_item)
    AutoIncRequest.stub(:find).and_return(auto_inc_request)
    auto_inc_request.stub(:destroy)
    delete 'destroy', :id => 1
  end
end
