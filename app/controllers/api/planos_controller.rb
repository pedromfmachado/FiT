class Api::PlanosController < ApiController
  load_and_authorize_resource
  def index
    respond_with Plano.where(:user_id => params[:user_id]).order(:data)
  end

  def show
    respond_with Plano.find(params[:id])  
  end
end

