require 'spec_helper'

describe "/bid_items/index.html.erb" do
  include BidItemsHelper

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end
  before(:each) do
     request.env['warden'] = mock(Warden, :authenticate => mock_user, :authenticate! => mock_user)
  end

  before(:each) do
    assigns[:bid_items] = [
      stub_model(BidItem,
        :title => "value for title",
        :body => "value for body"
      ),
      stub_model(BidItem,
        :title => "value for title",
        :body => "value for body"
      )
    ]
  end

  it "renders a list of bid_items" do
    render
    
  end
end
