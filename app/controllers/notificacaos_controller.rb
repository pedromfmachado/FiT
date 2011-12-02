class NotificacaosController < ApplicationController
	load_and_authorize_resource  

  # GET /notificacaos
  # GET /notificacaos.json
  def index
    @notificacaos = Notificacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @notificacaos }
    end
  end

  # GET /notificacaos/1
  # GET /notificacaos/1.json
  def show
    @notificacao = Notificacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @notificacao }
    end
  end

  # GET /notificacaos/new
  # GET /notificacaos/new.json
  def new
    @notificacao = Notificacao.new
	@notificacao.data = Date.today

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @notificacao }
    end
  end

  # GET /notificacaos/1/edit
  def edit
    @notificacao = Notificacao.find(params[:id])
  end

  # POST /notificacaos
  # POST /notificacaos.json
  def create
	if current_user.admin?
		params[:notificacao][:admin_id] = current_user.id
	end
	params[:notificacao][:data] = Date.today
    @notificacao = Notificacao.new(params[:notificacao])

    respond_to do |format|
      if @notificacao.save
        format.html { redirect_to @notificacao, :flash => { :success => "Notificaçao \"" + @notificacao.titulo + "\" criada com sucesso." } }
        format.json { render :json => @notificacao, :status => :created, :location => @notificacao }
      else
        format.html { render :action => "new" }
        format.json { render :json => @notificacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notificacaos/1
  # PUT /notificacaos/1.json
  def update
    @notificacao = Notificacao.find(params[:id])

    respond_to do |format|
      if @notificacao.update_attributes(params[:notificacao])
        format.html { redirect_to @notificacao, :flash => { :success => "Notificaçao \"" + @notificacao.titulo + "\" alterada com sucesso." } }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @notificacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notificacaos/1
  # DELETE /notificacaos/1.json
  def destroy
    @notificacao = Notificacao.find(params[:id])
    @notificacao.destroy

    respond_to do |format|
      format.html { redirect_to notificacaos_url }
      format.json { head :ok }
    end
  end
end

