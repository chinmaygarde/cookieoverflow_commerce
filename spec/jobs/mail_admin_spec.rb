require 'spec_helper'

describe MailAdmin do
  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end
  it "should enqueue the background job to mail an admin" do
    User.stub(:find).with(1).and_return(mock_user)
    AdminMailer.stub(:deliver_admin_message).with(1, "message")
    MailAdmin.perform(1, "message")
  end
end
