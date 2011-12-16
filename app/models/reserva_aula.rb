class ReservaAula < ActiveRecord::Base

	belongs_to :aula
	belongs_to :user


	validates :aula_id, :presence => true
	validates :user_id, :presence => true
	validates :dia, :presence => true

	validates_uniqueness_of :user_id, :scope => [:aula_id, :dia]

	validate :checkLotacao

	def self.jaMarcada(uid,aid)

		ReservaAula.where(:user_id => uid, :aula_id => aid, :dia => Date.today).count > 0

	end

	def self.getReserva(uid,aid,d)

		reservas = ReservaAula.where(:user_id => uid, :aula_id => aid, :dia => d)

		if reservas.count > 0
			reservas[0]
		end		

	end

	def self.lugaresDisponiveis(aid)

		aula = Aula.find(aid)
		estudio = Estudio.find(aula.estudio_id)

		estudio.lotacao - ReservaAula.where( :aula_id => aid, :dia => Date.today).count

	end

	def checkLotacao

		if ReservaAula.lugaresDisponiveis(aula_id) < 0
			errors.add(:lotacao , "A aula ja esta completa")
		end
		# verificar se a lotacao ja foi ultrapassada
	end

	require 'builder'
	def self.info(uid, aid)

		aula = Aula.find(aid)
		estudio = Estudio.find(aula.estudio_id)

		xml = ::Builder::XmlMarkup.new
		xml.instruct!
		xml.reserva do

			xml.lugares ReservaAula.lugaresDisponiveis(aula.id)
			xml.lotacao estudio.lotacao
			if(ReservaAula.jaMarcada(uid,aula.id))
				xml.tem_reserva "sim"
			else
				xml.tem_reserva "nao"
			end

		end

	end


end
