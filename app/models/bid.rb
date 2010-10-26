class Bid < ActiveRecord::Base
  #validates_numericality_of :bid_amount, :integer_only => true, :gt => 0

  belongs_to :user
  belongs_to :bid_item
end
