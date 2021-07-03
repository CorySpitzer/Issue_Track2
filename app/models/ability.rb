class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new 

    # guest user (not logged in)
    # can read Issues, Project and Comments
    can :read, Issue
    can :read, Project
    can :read, Comment

    if user != nil
      if user.role == "project_manager"
        # can do everything to everything
        can :manage, :all
      elsif user.role == "developer"
        can [:read, :update, :create], [Issue, Comment]
      else # end_user
        can [:create, :read], [Issue, Comment]
      end
    else # no user
      # p
      # p "user is nil"
      # p
      can :read, [Issue, Comment]
    end
  end
end
