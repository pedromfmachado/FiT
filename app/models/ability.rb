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
      cannot :create, PedidoPlano
    elsif user.staff?
      can :read, Notificacao
      can :read, Ginasio
      can :manage, Plano
      can :manage, Exercicio
      can :manage, User
      can :manage, Aula
      can :manage, TipoAula
      can :destroy, PedidoPlano
      cannot :create, ReservaAula
      cannot :update, User do |u|
	(u.admin? || u.staff?) && user.id != u.id
      end
      cannot :destroy, User do |u|
	u.admin? || u.staff?
      end
    elsif user.normal?
      can :read, Notificacao, :ginasio_id => user.ginasio_id
      can :read, Estudio
      can :read, TipoAula
      can :read, Aula
      can :manage, ReservaAula do |r|

            r.user_id == user.id && r.dia == Date.today

      end
      can :read, Ginasio
      can :pertocidade, Ginasio
      can :create, PedidoPlano
      can :read, Plano, :user_id => user.id
      can :show, User, :id => user.id
      can :update, User, :id => user.id
      can :edit_password, User, :id => user.id
    end
  end
end
