class Api::UsersController < ApiController
  def index
    respond_with User.find_by_token(params[:token])  
  end
end

