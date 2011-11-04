class PlanosController < ApplicationController
  load_and_authorize_resource  

  # GET /planos
  # GET /planos.xml
  def index
    if(params[:user_id])
      @planos = Plano.where(:user_id => params[:user_id]).order(:data)
      @user = User.find(params[:user_id])
    else
      @planos = Plano.all
    end

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
    @plano = Plano.new(:user_id => params[:user_id], :data => Date.today)
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /planos/1/edit
  def edit
    @plano = Plano.find(params[:id])
    @user = User.find(@plano.user_id)
  end

  # POST /planos
  # POST /planos.xml
  def create
    @exercicios = params[:selected_exercicios].split(",")
    params[:plano][:data] = Date.today
    @plano = Plano.new(params[:plano])
    @user = User.find(@plano.user_id)
    

    respond_to do |format|
      if @plano.save
        format.html { redirect_to(user_planos_path(@user), :notice => 'Plano was successfully created.') }
        format.xml  { render :xml => @plano, :status => :created, :location => @plano }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @plano.errors, :status => :unprocessable_entity }
      end
    end
    
    @exercicios.each do |ex|
	    @ex_splited = ex.split("|")
	    ExerciciosPlanos.create(:plano_id => @plano.id, :exercicio_id => @ex_splited[0], :peso => @ex_splited[1], :series => @ex_splited[2], :repeticoes => @ex_splited[3]);
    end

  end

  # PUT /planos/1
  # PUT /planos/1.xml
  def update
    @plano = Plano.find(params[:id])
    @exercicios = params[:selected_exercicios].split(",")
    @user = User.find(@plano.user_id)

    @exercicios.each do |ex|
      @ex_splited = ex.split("|")
	    ExerciciosPlanos.create(:plano_id => @plano.id, :exercicio_id => @ex_splited[0], :peso => @ex_splited[1], :series => @ex_splited[2], :repeticoes => @ex_splited[3]);
    end

    respond_to do |format|
      if @plano.update_attributes(params[:plano])
        format.html { redirect_to(user_planos_path(@user), :notice => 'Plano was successfully updated.') }
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
    @user = User.find(@plano.user_id)
    @plano.destroy

    respond_to do |format|
      format.html { redirect_to(user_planos_url(@user)) }
      format.xml  { head :ok }
    end
  end

end
