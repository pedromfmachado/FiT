class Api::AlimentarPlanosController < ApiController
  def index
    user = User.find_by_token(params[:token])
    respond_with AlimentarPlano.where(:user_id => user.id).order("data DESC")
  end
end

