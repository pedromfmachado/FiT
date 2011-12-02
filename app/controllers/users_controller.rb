class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    if params[:ginasio_id]
      @users = User.where(:ginasio_id => params[:ginasio_id])
    else
      @users = User.all
    end
  end

  def new
    @user = User.new
  end

  def create
    params[:user][:email] = params[:user][:email].downcase
    @user = User.new(params[:user])
    if @user.save

      if params[:filename] && params[:filename] != ""
        @user.flickr_auth
        url_foto = @user.upload_foto(params[:filename])
        @user.update_attributes(:url_foto => url_foto)
      end 
      redirect_to @user, :flash => { :success => "Utilizador registado com sucesso!" }
    else
      render "new"
    end  
  end

  # GET /exercicios/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if params[:filename] && params[:filename] != ""
      @user.flickr_auth
      params[:user][:url_foto] = @user.upload_foto(params[:filename])
    end 

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :flash => { :success => "Dados actualizados com sucesso!" }) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @exercicio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /exercicios/1
  # GET /exercicios/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
      format.json  { render :json => @user }
    end
  end

  # DELETE /exercicios/1
  # DELETE /exercicios/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  def promote
    @user = User.find(params[:id])
    @user.promote

    if @user.staff?
      redirect_to @user, :flash => { :success => "Utilizador " + @user.nome + " promovido a Staff com sucesso." }
    elsif @user.admin?
      redirect_to @user, :flash => { :success => "Utilizador " + @user.nome + " promovido a Administrador com sucesso." }
    end
     
  end

  def demote
    @user = User.find(params[:id])
    @user.demote

    if @user.staff?
      redirect_to @user, :flash => { :success => "Utilizador " + @user.nome + " relegado a Staff com sucesso." }
    elsif @user.normal?
      redirect_to @user, :flash => { :success => "Utilizador " + @user.nome + " relegado a Utilizador com successo." }
    end
  end

end

