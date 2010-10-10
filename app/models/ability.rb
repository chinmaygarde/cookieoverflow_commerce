# To change this template, choose Tools | Templates
# and open the template in the editor.
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    if user.role?("admin")
      can :manage, :all
      can :manage, :users
    end
    if user.role?("buyer")
      can :read, BidItem
    end
    if user.role?("seller")
      can :create, BidItem
      can [:update, :destroy], BidItem do |item|
        item.user == user
      end
    end    
  end
end