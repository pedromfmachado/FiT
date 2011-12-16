class PedidoPlanosController < ApplicationController
  load_and_authorize_resource
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
      p.user_id = params[:user_id]
      p.data_pedido = Time.now
    end

    @user = User.find(params[:user_id])

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to(@user, :flash => { :success => 'Pedido submetido com sucesso. Aguarde pelo nosso contacto.' }) }
        #format.xml  { render :xml => @pedido, :status => :created, :location => @exercicio }
      else
        format.html { redirect_to(@user, :flash => { :error => 'O seu pedido esta a ser tratado. Aguarde pelo nosso contacto.' }) }
        #format.xml
      end
    end

  end


  def destroy

    pedidos = PedidoPlano.where(:user_id => params[:user_id])
    pedidos.delete_all

    respond_to do |format|
      format.html { redirect_to(pedido_planos_path) }
      format.xml  { head :ok }
    end
  end

end
