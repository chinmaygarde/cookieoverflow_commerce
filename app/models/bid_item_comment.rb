class BidItemComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :bid_item
end
