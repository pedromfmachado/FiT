class UsersController < ApplicationController
  load_and_authorize_resource

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Utilizador Registado"
    else
      render "new"
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

  

end
