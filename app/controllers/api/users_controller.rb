class Api::UsersController < ApiController

  require 'builder'
  def index
    @user =  User.find_by_token(params[:token]) 
    render :xml => api_xml(@user)
  end

  def edit
    @user = User.find_by_token(params[:token])
    

    if @user.update_attributes(:nome => params[:nome], :email => params[:email], :datanascimento => params[:datanascimento],
                                :morada => params[:morada], :telefone => params[:telefone])
      
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

  require 'builder'
  def api_xml(user)
    xml = Builder::XmlMarkup.new(:indent=>2)
    xml.instruct!

    xml.user do
        xml.nome user.nome
        xml.datanascimento user.datanascimento
        xml.telefone user.telefone
        xml.morada user.morada
        xml.email user.email
        xml.token user.token
        if user.url_foto
		xml.foto user.get_foto
    	else
		xml.foto "http://fitec.heroku.com/images/missing.png"
	end
    end
   end

  skip_before_filter :verify_authenticity_token
end

