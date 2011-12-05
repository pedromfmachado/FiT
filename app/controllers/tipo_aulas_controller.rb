class TipoAulasController < ApplicationController
  # GET /tipo_aulas
  # GET /tipo_aulas.json
  def index
    @tipo_aulas = TipoAula.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tipo_aulas }
    end
  end

  # GET /tipo_aulas/1
  # GET /tipo_aulas/1.json
  def show
    @tipo_aula = TipoAula.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @tipo_aula }
    end
  end

  # GET /tipo_aulas/new
  # GET /tipo_aulas/new.json
  def new
    @tipo_aula = TipoAula.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @tipo_aula }
    end
  end

  # GET /tipo_aulas/1/edit
  def edit
    @tipo_aula = TipoAula.find(params[:id])
  end

  # POST /tipo_aulas
  # POST /tipo_aulas.json
  def create
    @tipo_aula = TipoAula.new(params[:tipo_aula])

    respond_to do |format|
      if @tipo_aula.save
        format.html { redirect_to @tipo_aula, :notice => 'Tipo aula was successfully created.' }
        format.json { render :json => @tipo_aula, :status => :created, :location => @tipo_aula }
      else
        format.html { render :action => "new" }
        format.json { render :json => @tipo_aula.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_aulas/1
  # PUT /tipo_aulas/1.json
  def update
    @tipo_aula = TipoAula.find(params[:id])

    respond_to do |format|
      if @tipo_aula.update_attributes(params[:tipo_aula])
        format.html { redirect_to @tipo_aula, :notice => 'Tipo aula was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @tipo_aula.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_aulas/1
  # DELETE /tipo_aulas/1.json
  def destroy
    @tipo_aula = TipoAula.find(params[:id])
    @tipo_aula.destroy

    respond_to do |format|
      format.html { redirect_to tipo_aulas_url }
      format.json { head :ok }
    end
  end
end
