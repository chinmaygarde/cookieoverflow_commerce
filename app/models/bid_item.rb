class BidItem < ActiveRecord::Base

  attr_accessible :title, :body, :picture, :starting_price
  validates_presence_of :title, :user_id, :starting_price
  validates_numericality_of :starting_price, :integer_only => true, :gt => 0

  #validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 5.megabytes
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png']

  belongs_to :user
  has_many :bid_item_comments
  
  has_attached_file :picture
  has_many :bids
  has_and_belongs_to_many :tags

  define_index do
    indexes title
    indexes body
  end
end
