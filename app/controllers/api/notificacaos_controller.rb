class Api::NotificacaosController < ApiController
  def index
    respond_with Notificacao.all
  end

  def show
	respond_with Notificacao.find(params[:id])
  end
end

