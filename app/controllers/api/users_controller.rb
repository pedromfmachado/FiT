class Api::UsersController < ApiController
  def index
    respond_with User.find_by_token(params[:token])  
  end

  def edit
    @user = User.find_by_token(params[:token])
    if @user.update_attributes(:nome => params[:nome], :email => params[:email], 
                               :datanascimento => params[:datanascimento], 
                               :morada => params[:morada], :telefone => params[:telefone])
    	render :xml => "success"
    else
	    render :xml => "fail"
    end
  end

  skip_before_filter :verify_authenticity_token
end

