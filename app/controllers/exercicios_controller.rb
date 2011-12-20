class ExerciciosController < ApplicationController
  load_and_authorize_resource  

  # GET /exercicios
  # GET /exercicios.xml
  def index
    @exercicios = Exercicio.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @exercicios }
      format.json  { render :json => @exercicios }
    end
  end

  # GET /exercicios/1
  # GET /exercicios/1.xml
  def show
    @exercicio = Exercicio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @exercicio }
      format.json  { render :json => @exercicios }
    end
  end

  # GET /exercicios/new
  # GET /exercicios/new.xml
  def new
    @exercicio = Exercicio.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @exercicio }
      format.json  { render :json => @exercicios }
    end
  end

  # GET /exercicios/1/edit
  def edit
    @exercicio = Exercicio.find(params[:id])
  end

  # POST /exercicios
  # POST /exercicios.xml
  def create
    @exercicio = Exercicio.new(params[:exercicio])

    respond_to do |format|
      if @exercicio.save
        format.html { redirect_to(@exercicio, :flash => { :success => 'Exercicio criado com sucesso.' }) }
        format.xml  { render :xml => @exercicio, :status => :created, :location => @exercicio }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @exercicio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /exercicios/1
  # PUT /exercicios/1.xml
  def update
    @exercicio = Exercicio.find(params[:id])

    respond_to do |format|
      if @exercicio.update_attributes(params[:exercicio])
        format.html { redirect_to(@exercicio, :flash => { :success => 'Exercicio alterado com sucesso.' }) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @exercicio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /exercicios/1
  # DELETE /exercicios/1.xml
  def destroy
    @exercicio = Exercicio.find(params[:id])
    @exercicio.destroy

    respond_to do |format|
      format.html { redirect_to(exercicios_url, :flash => { :notice => 'Exercicio apagado.' }) }
      format.xml  { head :ok }
    end
  end
end

