class Message < ActiveRecord::Base
  validates_presence_of :message
  belongs_to :from_user, :class_name => "User", :foreign_key => "from_user"
  belongs_to :to_user, :class_name => "User", :foreign_key => "to_user"
  
  validates_associated :from_user, :to_user
end
