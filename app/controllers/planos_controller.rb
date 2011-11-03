class PlanosController < ApplicationController

  # GET /planos
  # GET /planos.xml
  def index
    @planos = Plano.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @planos }
      format.json  { render :json => @planos }

    end
  end

  # GET /planos/1
  # GET /planos/1.xml
  def show
    @user = current_user
    @plano = Plano.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plano.to_xml(:include => :exercicios) }
      format.json  { render :json => @plano.to_json(:include => :exercicios) }
    end
  end

  # GET /planos/new
  # GET /planos/new.xml
  def new
    @plano = Plano.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /planos/1/edit
  def edit
    @plano = Plano.find(params[:id])
  end

  # POST /planos
  # POST /planos.xml
  def create
    @exercicios = params[:selected_exercicios].split(",")
    @plano = Plano.new(params[:plano])
    

    respond_to do |format|
      if @plano.save
        format.html { redirect_to(@plano, :notice => 'Plano was successfully created.') }
        format.xml  { render :xml => @plano, :status => :created, :location => @plano }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @plano.errors, :status => :unprocessable_entity }
      end
    end
    
    @exercicios.each do |ex_id|
	ExerciciosPlanos.create(:plano_id => @plano.id, :exercicio_id => ex_id);
    end

  end

  # PUT /planos/1
  # PUT /planos/1.xml
  def update
    @plano = Plano.find(params[:id])
    @exercicios = params[:selected_exercicios].split(",")

    @exercicios.each do |ex_id|
	ExerciciosPlanos.create(:plano_id => params[:id], :exercicio_id => ex_id);
    end

    respond_to do |format|
      if @plano.update_attributes(params[:plano])
        format.html { redirect_to(@plano, :notice => 'Plano was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plano.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /planos/1
  # DELETE /planos/1.xml
  def destroy
    @plano = Plano.find(params[:id])
    @plano.destroy

    respond_to do |format|
      format.html { redirect_to(planos_url) }
      format.xml  { head :ok }
    end
  end

  skip_before_filter :verify_authenticity_token
end
