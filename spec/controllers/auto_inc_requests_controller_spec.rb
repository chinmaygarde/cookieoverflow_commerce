require 'spec_helper'

describe AutoIncRequestsController do

  #Delete these examples and add some real ones
  it "should use AutoIncRequestsController" do
    controller.should be_an_instance_of(AutoIncRequestsController)
  end


  describe "GET 'create'" do
    it "should be successful" do
      get 'create'
      response.should be_success
    end
  end
end
