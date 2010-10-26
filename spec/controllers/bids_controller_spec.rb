require 'spec_helper'

describe BidsController do

  #Delete these examples and add some real ones
  it "should use BidsController" do
    controller.should be_an_instance_of(BidsController)
  end


  describe "GET 'create'" do
    it "should be successful" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "should be successful" do
      get 'destroy'
      response.should be_success
    end
  end
end
