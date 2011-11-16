class Api::PlanosController < ApiController
  def index
    @user = User.find_by_token(params[:token])
    respond_with @user.planos
  end

  def show
    @plano = Plano.find(params[:id])
    render :xml => @plano.to_xml(:include => :exercicios)
  end
end

