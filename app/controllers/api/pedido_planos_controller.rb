class Api::PedidoPlanosController < ApiController
  
  def create

		user = User.find_by_token(params[:token])
		reserva = PedidoPlano.new(:user_id => user.id, :data_pedido => Time.now)

		  if reserva.save
		    render :xml => message("success")
		  else
		    render :xml => message("fail")
		  end

	end

	def message(msg)
	    xml = Builder::XmlMarkup.new(:indent=>2)
	    xml.instruct!

	    xml.pedido do
	        xml.message msg
    end
  end
  
  skip_before_filter :verify_authenticity_token

end

