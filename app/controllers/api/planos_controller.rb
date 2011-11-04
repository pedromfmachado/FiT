class Api::PlanosController < ApiController
  load_and_authorize_resource
  def index
    respond_with Plano.where(:user_id => params[:user_id]).order("data DESC")
  end

  def show
    @plano = Plano.find(params[:id])
    render :xml => @plano.to_xml(:include => :exercicios)
  end
end

