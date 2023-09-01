class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    if user.role == 'admin'
      can :manage, :all # admin can do all things
    else
      can :read, :all
      can :manage, Comment, user_id: user.id
      can :manage, Post, user_id: user.id
    end
  end
end
