class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  
  has_many :bid_items
  has_many :bid_item_comments
  has_many :bids
  has_many :auto_inc_requests
  has_and_belongs_to_many :roles
  
  has_many :messages_received, :class_name => "Message", :foreign_key => "to_user"
  has_many :messages_sent, :class_name => "Message", :foreign_key => "from_user"
  
  define_index do
    indexes email
  end
  
  after_create :add_default_roles
  
  def role?(role)
    !roles.find_by_title(role).nil?
  end
  
  def add_default_roles
    roles << Role.find_by_title("buyer")
  end
  
  def become_seller
    # Needs optimization to removed the multiple finds.
    unless role?("seller")
      roles << Role.find_by_title("seller")
    end
  end
  
  def update_roles(*new_roles)
    roles.delete_all
    new_roles.each do |role|
      r = Role.find_by_title(role)
      roles << r if !r.nil?
    end
  end
  
  def recent_auctions(count=10)
    bid_items.find(:all, :limit => count, :order => "created_at desc")
  end
  
  def recent_bids(count=10)
    bids.find(:all, :limit => count, :order => "created_at desc")
  end
  
  def unread_messages(count=25)
    messages_received.find(:all, :limit => count, :order => "created_at desc", :conditions => { :unread => true})
  end
  
  def read_messages(count=25)
    messages_received.find(:all, :limit => count, :order => "created_at desc", :conditions => { :unread => false})
  end
  
  def sent_messages(count=25)
    messages_sent.find(:all, :limit => count, :order => "created_at desc")
  end
  
  def recent_comments(count=25)
    bid_item_comments.find(:all, :limit => count, :order => "created_at desc")
  end
end