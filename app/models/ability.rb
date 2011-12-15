class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new

    if user.admin?
      can :manage, :all
      cannot :requisitar_plano, Plano
      cannot :update, User do |u|
	u.admin? && user.id != u.id
      end
      cannot :destroy, User do |u|
	u.admin?
      end
      cannot :create, ReservaAula
    elsif user.staff?
      can :read, Aula
      can :read, Notificacao
      can :manage, Plano
      can :manage, Exercicio
      can :manage, User
      can :manage, Aula
      can :manage, TipoAula
      cannot :requisitar_plano, Plano
      cannot :update, User do |u|
	(u.admin? || u.staff?) && user.id != u.id
      end
      cannot :destroy, User do |u|
	u.admin? || u.staff?
      end
    elsif user.normal?
      can :read, Aula
      can :read, Notificacao, :ginasio_id => user.ginasio_id
      can :read, TipoAula
      can :read, Aula
      can :requisitar_plano, Plano
      can :read, Plano, :user_id => user.id
      can :show, User, :id => user.id
      can :update, User, :id => user.id
    end
  end
end
