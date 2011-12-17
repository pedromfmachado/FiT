class Turno < ActiveRecord::Base

	belongs_to :aula

	validates :hora, :presence => true

	def horaFormatada

		return hora.to_s(:time)

	end
	
end
