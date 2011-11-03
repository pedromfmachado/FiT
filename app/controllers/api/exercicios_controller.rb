class Api::ExerciciosController < ApiController
  def index
    respond_with Exercicio.all
  end

  def show
    respond_with Exercicio.find(params[:id])  
  end
end

