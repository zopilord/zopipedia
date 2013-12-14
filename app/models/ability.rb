class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 

    if user.role? :member
      can :manage, Wiki, :user_id => user.id
      can :read, Wiki
    end

    if user.role? :admin
      can :destroy, Wiki
      can :manage, :all
    end
    can :read, Wiki, private: false
  end
end