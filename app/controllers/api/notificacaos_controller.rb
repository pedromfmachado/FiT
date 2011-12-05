class Api::NotificacaosController < ApiController
  def index
		  @user = User.find_by_token(params[:token])
		  @notificacoes = Notificacao.where(:ginasio_id => @user.ginasio_id)
		  
			Notificacao.where(:ginasio_id => nil).each do |n|

				@notificacoes << n

    	end

    	render :xml => @notificacoes
  end

  def show
		respond_with Notificacao.find(params[:id])
  end
end

