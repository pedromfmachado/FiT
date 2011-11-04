class Api::ExerciciosController < ApiController
  load_and_authorize_resource
  def index
    respond_with Exercicio.all
  end

  def show
    respond_with Exercicio.find(params[:id])  
  end
end

