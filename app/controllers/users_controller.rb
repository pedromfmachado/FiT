class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end


  def new
    @user = User.new
  end

  def create
    params[:user][:email] = params[:user][:email].downcase
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Utilizador Registado"
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

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'Dados do utilizador actualizados.') }
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
      redirect_to @user, :notice => "User promoted to staff"
    elsif @user.admin?
      redirect_to @user, :notice => "User promoted to administrator"
    end
     
  end

  def demote
    @user = User.find(params[:id])
	@user.demote

    if @user.staff?
      redirect_to @user, :notice => "User demoted to Staff"
    elsif @user.normal?
      redirect_to @user, :notice => "User demoted to normal"
    end
  end

end
