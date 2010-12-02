require 'spec_helper'

describe MessagingController do
  def mock_message(stubs={})
    @mock_message ||= mock_model(Message, stubs)
  end
  
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
  
  it "should have a page to manage messages" do
    get 'manage'
  end
  
  it "should be able to create messages with valid params" do
    Message.stub(:new).and_return(mock_message(:save => true))
    post 'create'
  end
  
  it "should not be able to create messages with invalid params" do
    Message.stub(:new).and_return(mock_message(:save => false))
    post 'create'
  end
  
  it "should be able to mark a message as read" do
    Message.stub(:find).and_return(mock_message(:unread => true))
    message = mock_message
    message.should_receive(:unread=)
    message.should_receive(:save)
    post 'read'
  end
  
end
