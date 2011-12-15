class AulasController < ApplicationController
load_and_authorize_resource
  def index
    @aulas = Aula.where(:ginasio_id => params[:ginasio_id]).order('dia')
    @ginasio = Ginasio.find(params[:ginasio_id])

    @aulas_sorted = Aula.where(:ginasio_id => params[:ginasio_id]).group_by(&:dia)
    @dias_sorted = @aulas_sorted.keys.sort

    respond_to do |format|
      format.html #index.html.erb
    end

  end

  def edit
    @aula = Aula.find(params[:aula_id])
    @ginasio = Ginasio.find(params[:ginasio_id])
  end

  def update

  end

  def new
    @aula = Aula.new
    @ginasio = Ginasio.find(params[:ginasio_id])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /estudios
  # POST /estudios.json
  def create
    params[:aula][:ginasio_id] = params[:ginasio_id]
		@ginasio = Ginasio.find(params[:ginasio_id])
    @aula = Aula.new(params[:aula])

    respond_to do |format|
      if @aula.save
        format.html { redirect_to ginasio_aulas_path(params[:ginasio_id]), :notice => 'Aula was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

end
