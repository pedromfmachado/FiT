class Api::ReservaAulasController < ApiController
  def index

    @user = User.find_by_token(params[:token])
    respond_with ReservaAula.where(:user_id => @user.id, :dia => Date.today)

  end

  def get_info

    user = User.find_by_token(params[:token])

    render :xml => ReservaAula.info(user.id, params[:aula_id])

  end

	def create

		@user = User.find_by_token(params[:token])
		@reserva = ReservaAula.new(:aula_id => params[:aula_id], :user_id => @user.id, :dia => Date.today)

    if Date.today.wday-1 == @reserva.aula.dia 

		  if @reserva.save
		    render :xml => message("success")
		  else
		    render :xml => message("fail")
		  end

    else
      render :xml => message("fail")
    end

	end


  def destroy
    @user = User.find_by_token(params[:token])
    @reserva = ReservaAula.where(:aula_id => params[:aula_id], :user_id => @user.id, :dia => Date.today).first
    
    if @reserva.destroy
      render :xml => message("success")
    else
      render :xml => message("fail")
    end
  end

  def message(msg)
    xml = Builder::XmlMarkup.new(:indent=>2)
    xml.instruct!

    xml.reserva do
        xml.message msg
    end
  end

  skip_before_filter :verify_authenticity_token

end
