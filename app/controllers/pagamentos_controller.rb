class PagamentosController < ApplicationController
  

  def index

    if params[:mes] && params[:ano]

      Pagamento.update_mensal
      @pagamentos = Pagamento.where(:ano => params[:ano], :mes => params[:mes])
    else

  	   Pagamento.update_mensal
  	   @pagamentos = Pagamento.where(:ano => Time.now.year, :mes => Time.now.month)

    end

  	respond_to do |format|
      format.html # index.html.erb
    end

  end

  def confirmar

  	pagamento = Pagamento.find(params[:pagamento_id])

  	respond_to do |format|

  		if pagamento.update_attributes(:pago => true)
      		format.html {redirect_to pagamentos_path(:mes => pagamento.mes, :ano => pagamento.ano), :flash => {:success => "Confirmado pagamento"}}
      	else
      		format.html {redirect_to pagamentos_path(:mes => pagamento.mes, :ano => pagamento.ano), :flash => {:error => "Problema ao confirmar pagamento"}}
      	end
    end

  end

end
