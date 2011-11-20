class Api::UsersController < ApiController

  require 'builder'
  def index
    respond_with User.find_by_token(params[:token])  
  end

  def edit
    @user = User.find_by_token(params[:token])
    xml = Builder::XmlMarkup.new(:indent=>2)
    xml.instruct!

    if @user.update_attributes(:nome => params[:nome], :email => params[:email], 
                               :datanascimento => params[:datanascimento], 
                               :morada => params[:morada], :telefone => params[:telefone])
      
      xml.edit do
        xml.message "success"
      end
    	respond_with xml
    else
      xml.edit do
        xml.message "fail"
      end
	    respond_with xml
    end
  end

  skip_before_filter :verify_authenticity_token
end

