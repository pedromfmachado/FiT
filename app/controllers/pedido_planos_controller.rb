class PedidoPlanosController < ApplicationController
  def index
    
    @pedidos = PedidoPlano.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pedidos }
      format.json  { render :json => @pedidos }
    end
  end

  def create
    @pedido = PedidoPlano.new do |p|
      p.ginasio_id = params[:ginasio_id]
      p.user_id = params[:user_id]
      p.data_pedido = Time.now
    end

    @user = User.find(params[:user_id])

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to(@user, :flash => { :success => 'Pedido submetido com sucesso. Aguarde pelo nosso contacto.' }) }
        #format.xml  { render :xml => @pedido, :status => :created, :location => @exercicio }
      else
        format.html { redirect_to(@user, :flash => { :error => 'O seu pedido está a ser tratado. Aguarde pelo nosso contacto.' }) }
        #format.xml
      end
    end

  end


  def destroy
    @pedido = PedidoPlano.find(:user_id => params[:user_id], :ginasio_id => params[:ginasio_id])
    @pedido.destroy

    respond_to do |format|
      format.html { redirect_to(pedido_planos_url) }
      format.xml  { head :ok }
    end
  end

end
