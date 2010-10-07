class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  
  has_many :bid_items
  has_and_belongs_to_many :roles
  
  def role?(role)
    !roles.find_by_title(role).nil?
  end
end
