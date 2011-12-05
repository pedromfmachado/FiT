class Api::GinasiosController < ApiController
  def index
    respond_with Ginasio.all
  end

  def show
    respond_with Ginasios.find(params[:id])  
  end
end

