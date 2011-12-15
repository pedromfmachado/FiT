class ReservaAula < ActiveRecord::Base

	belongs_to :aula
	belongs_to :user

	# before_save :checkLotacao

	validates :aula_id, :presence => true
	validates :user_id, :presence => true
	validates :dia, :presence => true

	validates_uniqueness_of :user_id, :scope => [:aula_id, :dia]

	def self.jaMarcada(uid,aid,d)

		ReservaAula.where(:user_id => uid, :aula_id => aid, :dia => d).count > 0

	end

	def self.getReserva(uid,aid,d)

		@reservas = ReservaAula.where(:user_id => uid, :aula_id => aid, :dia => d)

		if @reservas.count > 0
			@reservas[0]
		end		

	end

	def checkLotacao

		@aula = Aula.find(aula_id)
		@estudio = Estudio.find(@aula.estudio_id)

		# verificar se a lotacao ja foi ultrapassada
	end

end
