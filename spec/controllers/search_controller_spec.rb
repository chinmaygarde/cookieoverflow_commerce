require 'spec_helper'

describe SearchController do

  #Delete these examples and add some real ones
  it "should use SearchController" do
    controller.should be_an_instance_of(SearchController)
  end


  describe "GET 'bid_item'" do
    it "should be successful" do
      get 'bid_item'
      response.should be_success
    end
  end
end
