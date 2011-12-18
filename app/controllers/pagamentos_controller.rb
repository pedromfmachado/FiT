class PagamentosController < ApplicationController
  

  def index

  	Pagamento.update_mensal
  	@pagamentos = Pagamento.where(:ano => Time.now.year, :mes => Time.now.month)

  	respond_to do |format|
      format.html # index.html.erb
    end

  end

  def confirmar

  	pagamento = Pagamento.find(params[:pagamento_id])

  	respond_to do |format|

  		if pagamento.update_attributes(:pago => true)
      		format.html {redirect_to pagamentos_path, :flash => {:success => "Confirmado pagamento"}}
      	else
      		format.html {redirect_to pagamentos_path, :flash => {:error => "Problema ao confirmar pagamento"}}
      	end
    end

  end

end
