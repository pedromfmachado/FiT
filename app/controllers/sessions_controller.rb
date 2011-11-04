class SessionsController < ApplicationController


  def new
    User.new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      respond_with session
    else
      :xml => { :error => 'User not autenticated' }, :status =>  149
    end
  end
end

  skip_before_filter :verify_authenticity_token
end
