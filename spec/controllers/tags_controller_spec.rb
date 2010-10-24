require 'spec_helper'

describe TagsController do

  #Delete these examples and add some real ones
  it "should use TagsController" do
    controller.should be_an_instance_of(TagsController)
  end


  describe "GET 'update'" do
    it "should be successful" do
      get 'update'
      response.should be_success
    end
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
