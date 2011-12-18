class AlimentarPlanosController < ApplicationController

  load_and_authorize_resource
  # GET /alimentar_planos
  # GET /alimentar_planos.json
  def index
    @alimentar_planos = AlimentarPlano.where(:user_id => params[:user_id])
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /alimentar_planos/1
  # GET /alimentar_planos/1.json
  def show
    @alimentar_plano = AlimentarPlano.find(params[:id])
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /alimentar_planos/new
  # GET /alimentar_planos/new.json
  def new
    @alimentar_plano = AlimentarPlano.new(:data => Date.today)
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /alimentar_planos/1/edit
  def edit
    @alimentar_plano = AlimentarPlano.find(params[:id])
    @user = User.find(params[:user_id])
  end

  # POST /alimentar_planos
  # POST /alimentar_planos.json
  def create
    params[:alimentar_plano][:user_id] = params[:user_id]
    params[:alimentar_plano][:data] = Date.today
    @alimentar_plano = AlimentarPlano.new(params[:alimentar_plano])
    @user = User.find(params[:user_id])
    
    respond_to do |format|
      if @alimentar_plano.save
        format.html { redirect_to user_alimentar_plano_path(@user,@alimentar_plano), :flash => { :success => 'Novo plano alimentar criado.' } }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /alimentar_planos/1
  # PUT /alimentar_planos/1.json
  def update
    @alimentar_plano = AlimentarPlano.find(params[:id])
    @user = User.find(params[:user_id])

    respond_to do |format|
      if @alimentar_plano.update_attributes(params[:alimentar_plano])
        format.html { redirect_to user_alimentar_plano_path(@user,@alimentar_plano), :flash => { :success => 'Plano alterado com sucesso.' } }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /alimentar_planos/1
  # DELETE /alimentar_planos/1.json
  def destroy
    @alimentar_plano = AlimentarPlano.find(params[:id])
    @alimentar_plano.destroy
    @user = User.find(params[:user_id])

    respond_to do |format|
      format.html { redirect_to user_alimentar_planos_path(@user) }
    end
  end
end

