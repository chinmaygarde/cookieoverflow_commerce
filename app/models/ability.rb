# To change this template, choose Tools | Templates
# and open the template in the editor.
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    if user.role?("admin")
      can :manage, :all
    end
    if user.role?("buyer")
      can :read, BidItem
      can :create, BidItemComment
      can [:update, :destroy], BidItemComment do |comment|
        comment.user == user
      end
    end
    if user.role?("seller")
      can :create, BidItem
      can [:update, :destroy], BidItem do |item|
        item.user == user
      end
      can :create, BidItemComment
      can :update, BidItemComment do |comment|
        comment.user == user
      end
      can :destroy, BidItemComment do |comment|
        comment.bid_item.user == user
      end
      can [:create, :update, :destroy], Tag do |tag_name|
        tag_name.bid_item.user == user
      end
    end    
  end
end