class Api::UsersController < ApiController

  require 'builder'
  def index
    respond_with User.find_by_token(params[:token])  
  end

  def edit
    @user = User.find_by_token(params[:token])
    

    if @user.update_attributes(:nome => params[:nome], :email => params[:email] )
      
      render :xml => message("success")
    else
      render :xml => message("fail")
    end
  end

  def message(msg)
    xml = Builder::XmlMarkup.new(:indent=>2)
    xml.instruct!

    xml.edit do
        xml.message msg
    end
  end

  skip_before_filter :verify_authenticity_token
end

