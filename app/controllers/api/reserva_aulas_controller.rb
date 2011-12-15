class Api::ReservaAulasController < ApiController
  def index

    @user = User.find_by_token(params[:token])
    respond_with ReservaAula.where(:user_id => @user.id, :dia => Date.today)

  end

	def create

		@user = User.find_by_token(params[:token])
		@reserva = ReservaAula.new(:aula_id => params[:aula_id], :user_id => @user.id, :dia => Date.today)

		  if @reserva.save
		    render :xml => message("success")
		  else
		    render :xml => message("fail")
		  end

	end


  def destroy
    @reserva = ReservaAula.find(params[:reserva_id])
    
    if @reserva.destroy
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
