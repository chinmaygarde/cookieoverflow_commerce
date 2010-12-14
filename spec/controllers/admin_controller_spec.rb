require 'spec_helper'

describe AdminController do
  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end
  before(:each) do
     request.env['warden'] = mock(Warden, :authenticate => mock_user, :authenticate! => mock_user)
  end
  it "get a list of all users" do
    User.stub(:all).and_return([mock_user])
    get :select_user
    assigns[:users].should == [mock_user]
  end
  it "should display a list of available user permissions" do
    User.stub(:find).and_return(mock_user)
    post :edit_user_permissions, {:user_id => 1}
    assigns[:user].should == mock_user
  end
  it "should change user permission" do
    User.stub(:find).and_return(mock_user)
    post :change_user_permissions, {:user_id => 1, :roles => ["buyer", "seller"]}
  end
  
  it "should show the admin mail page for authenticated users" do
    get :mail
  end
  
  it "should be able to send mail" do
    Resque.stub(:enqueue)
    post :send_mail
    response.should redirect_to(root_url)
  end
  
  it "should be able to add the seller role to a buyer" do
    post :become_seller
    response.should redirect_to(bid_items_path)
  end
end
