class Turno < ActiveRecord::Base

	belongs_to :aula

	def horaFormatada

		return hora.to_s + "h00"

	end
	
end
