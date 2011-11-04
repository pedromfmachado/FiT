class Api::SessionsController < ApiController


  def new
    User.new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
  skip_before_filter :verify_authenticity_token
end
