require 'spec_helper'

describe MessagingControllerController do

  #Delete these examples and add some real ones
  it "should use MessagingControllerController" do
    controller.should be_an_instance_of(MessagingControllerController)
  end


  describe "GET 'manage'" do
    it "should be successful" do
      get 'manage'
      response.should be_success
    end
  end
end
