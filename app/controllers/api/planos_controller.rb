class Api::PlanosController < ApiController
  def index
    @user = User.find_by_token(params[:token])
    render :xml => @user.planos.order('data DESC')
  end

  def show
    @plano = Plano.find(params[:id])
    render :xml => @plano.xml_plano()
  end
end

