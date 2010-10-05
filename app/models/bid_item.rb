class BidItem < ActiveRecord::Base
  attr_accessible :title, :body
  validates_presence_of :title
  
  def goodbye
    
  end
end
