class Api::SessionsController < ApiController


  def new
    User.new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      respond_with session.to_xml
    end
  end


  skip_before_filter :verify_authenticity_token
end
