class ReservaAulasController < ApplicationController
  

	def create
		@aula = Aula.find(params[:aula_id])
		@ginasio = Ginasio.find(@aula.ginasio_id)
		@reserva = ReservaAula.new(:aula_id => params[:aula_id], :user_id => params[:user_id], :dia => Date.today)

		respond_to do |format|
			if @reserva.save
				format.html { redirect_to ginasio_aulas_path(@ginasio), :flash => { :success => 'Aula marcada!' } }
			else
				format.html { redirect_to ginasio_aulas_path(@ginasio), :flash => { :error => 'Marcacao ja efectuada!' } }
			end
		end
	end


	def destroy

		@reserva = ReservaAula.find(params[:id])
		@aula = Aula.find(@reserva.aula_id)
		@ginasio = Ginasio.find(@aula.ginasio_id)
    
		@reserva.destroy

    respond_to do |format|
      format.html { redirect_to ginasio_aulas_path(@ginasio), :flash => { :success => 'Aula cancelada!' } }
    end
  end

end
