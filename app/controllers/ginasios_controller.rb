class GinasiosController < ApplicationController
  load_and_authorize_resource 

  # GET /ginasios
  # GET /ginasios.json
  def index
    @ginasios = Ginasio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ginasios }
    end
  end

  def pertocidade
    results = Geocoder.search(params[:cidade])
    @ginasios = Ginasio.near([results[0].latitude,results[0].longitude],params[:km].to_f*0.62)
    respond_to do |format|
      format.xml { render :xml => @ginasios }
    end
  end

  # GET /ginasios/1
  # GET /ginasios/1.json
  def show
    @ginasio = Ginasio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @ginasio }
    end
  end

  # GET /ginasios/new
  # GET /ginasios/new.json
  def new
    @ginasio = Ginasio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ginasio }
    end
  end

  # GET /ginasios/1/edit
  def edit
    @ginasio = Ginasio.find(params[:id])
  end

  # POST /ginasios
  # POST /ginasios.json
  def create
    @ginasio = Ginasio.new(params[:ginasio])

    respond_to do |format|
      if @ginasio.save
        format.html { redirect_to @ginasio, :flash => { :success => 'Ginasio criado com sucesso!' } }
        format.json { render :json => @ginasio, :status => :created, :location => @ginasio }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ginasio.errors, :status => :unprocessable_entity }
      end
    end
  end	

  # PUT /ginasios/1
  # PUT /ginasios/1.json
  def update
    @ginasio = Ginasio.find(params[:id])

    respond_to do |format|
      if @ginasio.update_attributes(params[:ginasio])
        format.html { redirect_to @ginasio, :flash => { :success => 'Dados do ginasio alterados com successo!' } }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ginasio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ginasios/1
  # DELETE /ginasios/1.json
  def destroy
    @ginasio = Ginasio.find(params[:id])
    @ginasio.destroy

    respond_to do |format|
      format.html { redirect_to ginasios_url, :flash => { :notice => 'Ginasio apagado.' } }
      format.json { head :ok }
    end
  end
end

