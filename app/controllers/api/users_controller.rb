class Api::UsersController < ApiController
  def index
    respond_with User.find_by_token(params[:token])  
  end

  def edit
    @user = User.find_by_token(params[:token])
    if @user.update_attributes(:nome => params[:nome], :email => params[:email], :datanascimento => params[:datanascimento], :morada => params[:morada], :telefone => params[:telefone])
    	session[:message] = 'success'
    else
	session[:message] = 'error'
    respond_with session
    end
  end
end

