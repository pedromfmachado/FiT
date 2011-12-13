class Api::AulasController < ApiController

  def index

    @user = User.find_by_token(params[:token])
    @ginasio = Ginasio.find(@user.ginasio_id)

    respond_with @ginasio.aulas.order(:diaSemana)

  end

end
