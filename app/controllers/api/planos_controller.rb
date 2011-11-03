class Api::PlanosController < ApiController
  def index
    respond_with Plano.where(:user_id => params[:user_id])
  end

  def show
    respond_with Plano.find(params[:id])  
  end
end

