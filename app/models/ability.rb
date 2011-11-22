class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new

    if user.admin?
      can :manage, :all
      cannot :update, User do |u|
	u.admin? && user.id != u.id
      end
      cannot :destroy, User do |u|
	u.admin?
      end
    elsif user.staff?
      can :read, Notificacao
      can :manage, Plano
      can :manage, Exercicio
      can :manage, User
      cannot :update, User do |u|
	(u.admin? || u.staff?) && user.id != u.id
      end
      cannot :destroy, User do |u|
	u.admin? || u.staff?
      end
    elsif user.normal?
      can :read, Notificacao
      can :read, Plano, :user_id => user.id
      can :show, User, :id => user.id
      can :edit, User, :id => user.id
    else
      can :manage, Session    
    end
  end
end
