class SessionsController < ApplicationController


  def new
    User.new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      respond_to do |format|
        format.html {redirect_to(root_url, :notice => "Logged in!")}
      end
    else
      respond_to do |format|
        format.html {redirect_to(root_url, :notice => 'Invalid email or password')}
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
