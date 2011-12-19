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
      cannot :edit_password, User do |u|

        u.id != user.id

      end
      cannot :promote, User, :id => user.id
      
      cannot :demote, User, :id => user.id
      
    elsif user.staff?
      can :manage, AlimentarPlano
      can :manage, Aula
      can :read, Estudio
      can :manage, Exercicio
      can :read, Ginasio
      can :pertocidade, Ginasio
      can :read, ModalidadePagamento
      can :read, Notificacao
      can :manage, Pagamento
      can :manage, PedidoPlano
      can :manage, Plano
      can :manage, User      
      can :read, ReservaAula
      can :manage, TipoAula
      cannot :index, Estatistica
      cannot :create, PedidoPlano
      cannot :create, Plano do |p|

        !p.user.normal?

      end
      cannot :update, User do |u|
	    
        (u.admin? || u.staff?) && user.id != u.id
      
      end
      cannot :destroy, User
      cannot :edit_password, User do |u|

        u.id != user.id

      end

    elsif user.normal?
      can :read, AlimentarPlano, :user_id => user.id
      can :read, Aula
      can :read, Estudio
      can :read, Ginasio
      can :pertocidade, Ginasio
      can :read, ModalidadePagamento
      can :read, Notificacao do |n|

         n.ginasio_id == user.ginasio_id || n.ginasio_id == nil
      
      end
      can :read, Pagamento, :user_id => user.id
      can :create, PedidoPlano
      can :read, Plano, :user_id => user.id
      can :manage, ReservaAula do |r|
      
            (r.user_id == user.id || r.user_id == nil) &&
            (r.aula_id == nil || Aula.find(r.aula_id).ginasio_id == user.ginasio_id) &&
            (r.dia == nil || r.dia == Time.now.wday)

      end
      can :read, TipoAula
      can :show, User do |u|

          u.admin? || u.staff? || u.id == user.id

      end
      can :update, User, :id => user.id
      can :edit_password, User, :id => user.id
      cannot :index, Estatistica
    end
  end
end
