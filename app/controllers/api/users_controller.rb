class Api::UsersController < ApiController
  def index
    respond_with User.all
  end

  def show
    respond_with User.find(params[:id])  
  end
  
  def show_planos
    respond_with User.find(params[:id]).planos
  end
end

