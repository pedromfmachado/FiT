class SessionsController < ApplicationController

  def new
    User.new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      redirect_to root_url, :alert => "Invalid email or password"
    end

    respond_to do |format|
      format.html { redirect_to(root_url, :notice => 'Logged in.') }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

  def index
  end

  def edit
  end

  def update
  end

end
