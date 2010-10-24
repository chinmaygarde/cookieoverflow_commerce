class BidItem < ActiveRecord::Base
  attr_accessible :title, :body, :picture
  validates_presence_of :title, :user_id

#validates_attachment_presence :picture
validates_attachment_size :picture, :less_than => 5.megabytes
validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png']


  
  belongs_to :user
  has_many :bid_item_comments
  has_attached_file :picture
end
