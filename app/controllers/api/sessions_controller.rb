class Api::SessionsController < ApplicationController


  def new
    User.new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      respond_to do |format|
        format.html {redirect_to(root_url, :notice => "Logged in!")}
        format.xml { render :xml => session }
      end
    else
      respond_to do |format|
        format.html {redirect_to(root_url, :notice => 'Invalid email or password')}
        format.xml  { render :xml => { :error => 'User not autenticated' }, :status =>  149 }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
