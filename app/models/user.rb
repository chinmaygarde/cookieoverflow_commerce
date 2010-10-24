class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  
  has_many :bid_items
  has_many :bid_item_comments
  has_and_belongs_to_many :roles
  
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
end
