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

  def promote
    @user = User.find(params[:id])

    if @user.normal?
      Staff.create(:user_id => @user.id)
      redirect_to @user, :notice => "User promoted to staff"
    elsif @user.staff?
      Admin.create(:user_id => @user.id)
      Staff.find_by_user_id(@user.id).destroy
      redirect_to @user, :notice => "User promoted to administrator"
    end
     
  end

  def demote
    @user = User.find(params[:id])

    if @user.admin?
      Staff.create(:user_id => @user.id)
      Admin.find_by_user_id(@user.id).destroy
      redirect_to @user, :notice => "User demoted to Staff"
    elsif @user.staff?
      Staff.find_by_user_id(@user.id).destroy
      redirect_to @user, :notice => "User demoted to normal"
    end
  end

end
