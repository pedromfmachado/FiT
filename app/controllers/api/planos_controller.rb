class Api::PlanosController < ApiController
  def index
    @user = User.find_by_token(params[:token]).order('data DESC')
    render :xml => @user.planos
  end

  def show
    @plano = Plano.find(params[:id])
    render :xml => @plano.xml_plano()
  end
end

