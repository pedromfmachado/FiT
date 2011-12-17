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

  def show

    @aula = Aula.find(params[:id])
    @reservas = ReservaAula.where(:aula_id => params[:id], :dia => Date.today)

  end

  def edit
    @aula = Aula.find(params[:id])
    @ginasio = Ginasio.find(params[:ginasio_id])

    @aula.inicio = @aula.inicio.to_s(:time)
  end

  def update

    @aula = Aula.find(params[:id])
    @ginasio = Ginasio.find(params[:ginasio_id])

    respond_to do |format|
      if @aula.update_attributes(params[:aula])
        format.html { redirect_to ginasio_aulas_path(@ginasio), :flash => { :success => "Aula alterada com sucesso." } }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def new
    @aula = Aula.new
    @ginasio = Ginasio.find(params[:ginasio_id])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    params[:aula][:ginasio_id] = params[:ginasio_id]
		@ginasio = Ginasio.find(params[:ginasio_id])
    @aula = Aula.new(params[:aula])

    respond_to do |format|
      if @aula.save
        format.html { redirect_to ginasio_aulas_path(params[:ginasio_id]), :notice => 'Aula criada com sucesso.' }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def destroy
    aula = Aula.find(params[:id])
    ginasio = Ginasio.find(params[:ginasio_id])

    aula.destroy

    respond_to do |format|
      format.html { redirect_to(ginasio_aulas_path(ginasio)) }
      format.xml  { head :ok }
    end
  end

end
