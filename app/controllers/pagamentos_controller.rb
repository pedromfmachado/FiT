class PagamentosController < ApplicationController
  load_and_authorize_resource  

  def index

    if params[:user_id] && params[:ano]

      Pagamento.update_mensal
      @pagamentos = Pagamento.where(:ano => params[:ano], :user_id => params[:user_id])

    elsif params[:mes] && params[:ano]

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
            if params[:user_id]
                format.html {redirect_to user_pagamentos_path(pagamento.user_id, :ano => pagamento.ano), :flash => {:success => "Confirmado pagamento"}}
            else
      		    format.html {redirect_to pagamentos_path(:mes => pagamento.mes, :ano => pagamento.ano), :flash => {:success => "Confirmado pagamento"}}
            end
      	else
      		if params[:user_id]
                format.html {redirect_to user_pagamentos_path(pagamento.user_id, :ano => pagamento.ano), :flash => {:success => "Problema ao confirmar pagamento"}}
            else
      		    format.html {redirect_to pagamentos_path(:mes => pagamento.mes, :ano => pagamento.ano), :flash => {:success => "Problema ao confirmar pagamento"}}
            end
      	end
    end

  end

  def cancelar

    pagamento = Pagamento.find(params[:pagamento_id])

    respond_to do |format|

        if pagamento.update_attributes(:pago => false)
            if params[:user_id]
                format.html {redirect_to user_pagamentos_path(pagamento.user_id, :ano => pagamento.ano), :flash => {:success => "Pagamento anulado"}}
            else
      		    format.html {redirect_to pagamentos_path(:mes => pagamento.mes, :ano => pagamento.ano), :flash => {:success => "Pagamento anulado"}}
            end
      	else
      		if params[:user_id]
                format.html {redirect_to user_pagamentos_path(pagamento.user_id, :ano => pagamento.ano), :flash => {:success => "Problema ao anular pagamento"}}
            else
      		    format.html {redirect_to pagamentos_path(:mes => pagamento.mes, :ano => pagamento.ano), :flash => {:success => "Problema ao anular pagamento"}}
            end
      	end
    end

  end

end
