class ModalidadePagamentosController < ApplicationController
  # GET /modalidade_pagamentos
  # GET /modalidade_pagamentos.json
  def index
    @modalidade_pagamentos = ModalidadePagamento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @modalidade_pagamentos }
    end
  end

  # GET /modalidade_pagamentos/1
  # GET /modalidade_pagamentos/1.json
  def show
    @modalidade_pagamento = ModalidadePagamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @modalidade_pagamento }
    end
  end

  # GET /modalidade_pagamentos/new
  # GET /modalidade_pagamentos/new.json
  def new
    @modalidade_pagamento = ModalidadePagamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @modalidade_pagamento }
    end
  end

  # GET /modalidade_pagamentos/1/edit
  def edit
    @modalidade_pagamento = ModalidadePagamento.find(params[:id])
  end

  # POST /modalidade_pagamentos
  # POST /modalidade_pagamentos.json
  def create
    @modalidade_pagamento = ModalidadePagamento.new(params[:modalidade_pagamento])

    respond_to do |format|
      if @modalidade_pagamento.save
        format.html { redirect_to @modalidade_pagamento, :flash => { :success => 'Modalidade de pagamento criada com sucesso.'} }
        format.json { render :json => @modalidade_pagamento, :status => :created, :location => @modalidade_pagamento }
      else
        format.html { render :action => "new" }
        format.json { render :json => @modalidade_pagamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /modalidade_pagamentos/1
  # PUT /modalidade_pagamentos/1.json
  def update
    @modalidade_pagamento = ModalidadePagamento.find(params[:id])

    respond_to do |format|
      if @modalidade_pagamento.update_attributes(params[:modalidade_pagamento])
        format.html { redirect_to @modalidade_pagamento, :flash => { :success => 'Modalidade de pagamento alterada com sucesso.'} }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @modalidade_pagamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /modalidade_pagamentos/1
  # DELETE /modalidade_pagamentos/1.json
  def destroy
    @modalidade_pagamento = ModalidadePagamento.find(params[:id])
    @modalidade_pagamento.destroy

    respond_to do |format|
      format.html { redirect_to modalidade_pagamentos_url }
      format.json { head :ok }
    end
  end
end
