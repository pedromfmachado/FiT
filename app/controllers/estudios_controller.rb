class EstudiosController < ApplicationController
	load_and_authorize_resource 

  # GET /estudios
  # GET /estudios.json
  def index
    @estudios = Estudio.where(:ginasio_id => params[:ginasio_id])
    @ginasio = Ginasio.find(params[:ginasio_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @estudios }
    end
  end

  # GET /estudios/1
  # GET /estudios/1.json
  def show
    @estudio = Estudio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @estudio }
    end
  end

  # GET /estudios/new
  # GET /estudios/new.json
  def new
    @estudio = Estudio.new
    @ginasio = Ginasio.find(params[:ginasio_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @estudio }
    end
  end

  # GET /estudios/1/edit
  def edit
    @estudio = Estudio.find(params[:id])
    @ginasio = Ginasio.find(params[:ginasio_id])
  end

  # POST /estudios
  # POST /estudios.json
  def create
    params[:estudio][:ginasio_id] = params[:ginasio_id]
    @estudio = Estudio.new(params[:estudio])

    respond_to do |format|
      if @estudio.save
        format.html { redirect_to ginasio_estudio_path(params[:ginasio_id],@estudio), :notice => 'Estudio was successfully created.' }
        format.json { render :json => @estudio, :status => :created, :location => @estudio }
      else
        format.html { render :action => "new" }
        format.json { render :json => @estudio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /estudios/1
  # PUT /estudios/1.json
  def update
    @estudio = Estudio.find(params[:id])
    @ginasio = Ginasio.find(params[:ginasio_id])
    respond_to do |format|
      if @estudio.update_attributes(params[:estudio])
        format.html { redirect_to ginasio_estudio_path(@ginasio, @estudio), :notice => 'Estudio was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @estudio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /estudios/1
  # DELETE /estudios/1.json
  def destroy
    @estudio = Estudio.find(params[:id])
    @estudio.destroy
    @ginasio = Ginasio.find(params[:ginasio_id])

    respond_to do |format|
      format.html { redirect_to ginasio_estudios_path(@ginasio) }
      format.json { head :ok }
    end
  end
end
