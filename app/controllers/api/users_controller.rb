class Api::UsersController < ApiController
  load_and_authorize_resource

  def show
    respond_with User.find(params[:id])  
  end
end

