# To change this template, choose Tools | Templates
# and open the template in the editor.
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Anonymous user
    if user.role? :admin
      can :manage, :all
    else
      can :read, :all
    end
  end
end