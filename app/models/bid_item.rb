class BidItem < ActiveRecord::Base
  attr_accessible :title, :body, :starting_price
  validates_presence_of :title, :user_id, :starting_price
  validates_numericality_of :starting_price, :integer_only => true, :gt => 0

  belongs_to :user
  has_many :bid_item_comments
  has_many :bids
  has_and_belongs_to_many :tags
end
