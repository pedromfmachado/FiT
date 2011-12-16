class Aula < ActiveRecord::Base
	belongs_to :staff
	belongs_to :estudio
	belongs_to :tipo_aula
	belongs_to :ginasio

	has_many :reserva_aulas

	validates :estudio_id, :presence => true
	validates :staff_id, :presence => true
	validates :tipo_aula_id, :presence => true
	validates :dia, :presence => true
	validates :ginasio_id, :presence => true
	validates :inicio, :presence => true
	validates :duracao, :presence => true

	validate :professor_so_da_uma_aula, :sala_so_tem_uma_aula

	#/( (2[0-3]) | (([0-1]?) (\d{1})) )h(\d{2})/
	#validates_uniqueness_of :staff_id, :scope => [:turno_id, :dia]
	#validates_uniqueness_of :estudio_id, :scope => [:turno_id, :dia]

	

	def sala_so_tem_uma_aula

		Aula.all.each do |aula|

			if (aula.inicio + aula.duracao*60)> self.inicio && aula.estudio_id == self.estudio_id && aula.dia == dia

				errors.add(:sala, "A sala ja esta ocupada nesta hora")

			end

		end

	end

	def professor_so_da_uma_aula

		Aula.all.each do |aula|

			if (aula.inicio + aula.duracao*60)> self.inicio && aula.staff_id == self.staff_id && aula.dia == dia

				errors.add(:professor, "O professor ja esta ocupado nesta hora")

			end

		end

	end

	def self.getDia(d)
		dias = [ 'Segunda' , 'Terca', 'Quarta', 'Quinta', 'Sexta', 'Sabado', 'Domingo' ]

		if d != nil
			dias[d]
		end
	end

	require 'builder'
	def to_xml(options ={})
		if options[:builder]
			build_xml(options[:builder])
		else
			xml = Builder::XmlMarkup.new
			xml.instruct!
			build_xml(xml)
		end
	end

	def build_xml(xml)

		xml.aula do
			xml.id id
			xml.data Time.now
			xml.dia dia
			xml.hora inicio.to_s(:time)
			xml.duracao duracao
			xml.ginasio Ginasio.find(ginasio_id).nome
			xml.estudio Estudio.find(estudio_id).nome
			xml.staff User.find(staff_id).nome
			xml.modalidade TipoAula.find(tipo_aula_id).tipo
		end
	end 



end
