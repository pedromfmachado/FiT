class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new

    if user.admin?
      can :manage, :all

      cannot :create, PedidoPlano
      cannot :create, Plano do |p|

        !p.user.normal?

      end
      cannot :create, ReservaAula
      cannot :update, User do |u|

	    u.admin? && user.id != u.id
     
      end
      cannot :destroy, User do |u|
	  
        u.admin?
      
      end
      
      
    elsif user.staff?
      can :manage, Aula
      can :read, Estudio
      can :manage, Exercicio
      can :read, Ginasio
      can :read, ModalidadePagamento
      can :read, Notificacao
      can :manage, Pagamento
      can :manage, PedidoPlano
      can :manage, Plano
      can :manage, User      
      can :read, ReservaAula
      can :manage, TipoAula
      cannot :create, PedidoPlano
      cannot :create, Plano do |p|

        !p.user.normal?

      end
      cannot :update, User do |u|
	    
        (u.admin? || u.staff?) && user.id != u.id
      
      end
      cannot :destroy, User do |u|
	    
        u.admin? || u.staff?
    
      end

    elsif user.normal?
      can :read, Aula
      can :read, Estudio
      can :read, Ginasio
      can :pertocidade, Ginasio
      can :read, ModalidadePagamento
      can :read, Notificacao do |n|

         n.ginasio_id == user.ginasio_id || n.ginasio_id == nil
      
      end
      can :create, PedidoPlano
      can :read, Plano, :user_id => user.id
      can :manage, ReservaAula do |r|
      
            (r.user_id == user.id || r.user_id == nil) &&
            (r.aula_id == nil || Aula.find(r.aula_id).ginasio_id == user.ginasio_id) &&
            (r.dia == nil || r.dia == Time.now.wday)

      end
      can :read, TipoAula
      can :show, User, :id => user.id
      can :update, User, :id => user.id
      can :edit_password, User, :id => user.id
    end
  end
end
