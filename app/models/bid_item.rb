class BidItem < ActiveRecord::Base

  attr_accessible :title, :body, :picture, :starting_price, :end_time, :next_bid_delta
  validates_presence_of :title, :user_id, :starting_price
  validates_numericality_of :starting_price, :integer_only => true, :gt => 0

  validates_attachment_size :picture, :less_than => 2.megabytes
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png']
  
  validates_presence_of :end_time
  validates_presence_of :next_bid_delta
  
  belongs_to :user
  has_many :bid_item_comments
  has_many :auto_inc_requests
  
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :bids
  has_and_belongs_to_many :tags
  
  after_create :setup_bid_finishing_tasks
  
  after_save :notify_bidders_of_modifications

  before_destroy :notify_bidders_of_deletion

  define_index do
    indexes title
    indexes body
  end
  
  def highest_bid
    bids.find(:first, :order => "bid_amount desc")
  end
  
  def latest_bids(number=10)
    bids.find(:all, :order => "bid_amount desc", :limit => number)
  end
  
  def minimum_bidding_price
    if highest_bid.nil?
      starting_price
    else
      highest_bid.bid_amount + next_bid_delta
    end
  end
  
  def is_open?
    DateTime.now < end_time
  end
  
  def setup_bid_finishing_tasks
    Resque.enqueue_at(end_time, MailWinner, id)
    Resque.enqueue_at(end_time, MailSeller, id)
  end
  
  def notify_bidders_of_modifications
    Resque.enqueue(NotifyBiddersOfModifications, id, "modified")
  end
  
  def notify_bidders_of_deletion
    mails = bids.each.collect { |b| b.user.email }.uniq
    Resque.enqueue(NotifyBiddersOfDeletion, "#{title}: #{body}", mails)
  end
end
