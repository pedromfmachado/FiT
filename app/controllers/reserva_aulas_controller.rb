class ReservaAulasController < ApplicationController
  load_and_authorize_resource

  	def index
  		
  		if params[:aula_id]
  			@reservas = ReservaAula.where(:aula_id => params[:aula_id])
  		elsif params[:user_id]
  			@reservas = ReservaAula.where(:user_id => params[:user_id])
  		else
  			@reservas = ReservaAula.all
  		end
  	end

	def create
		@aula = Aula.find(params[:aula_id])
		@ginasio = Ginasio.find(@aula.ginasio_id)
		@reserva = ReservaAula.new(:aula_id => params[:aula_id], :user_id => params[:user_id], :dia => Date.today)

		respond_to do |format|
			if @reserva.save
				format.html { redirect_to ginasio_aula_path(@ginasio,@aula), :flash => { :success => 'Aula marcada!' } }
			else
				format.html { redirect_to ginasio_aula_path(@ginasio,@aula), :flash => { :error => @reserva.errors.first[1]  } }
			end
		end
	end


	def destroy
		@aula = Aula.find(params[:aula_id])
		@ginasio = Ginasio.find(@aula.ginasio_id)
    
		ReservaAula.delete_all(:aula_id => @aula.id, :user_id => params[:user_id], :dia => Date.today)

    respond_to do |format|
      format.html { redirect_to ginasio_aula_path(@ginasio,@aula), :flash => { :success => 'Aula cancelada!' } }
    end
  end

end
