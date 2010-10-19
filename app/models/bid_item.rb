class BidItem < ActiveRecord::Base
  attr_accessible :title, :body
  validates_presence_of :title, :user_id
  
  belongs_to :user
  has_many :bid_item_comments
end
