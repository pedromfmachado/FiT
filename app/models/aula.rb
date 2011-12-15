class Aula < ActiveRecord::Base
	belongs_to :turno
	belongs_to :staff
	belongs_to :estudio
	belongs_to :tipo_aula
	belongs_to :ginasio

	has_many :reserva_aulas

	validates :turno_id, :presence => true
	validates :estudio_id, :presence => true
	validates :staff_id, :presence => true
	validates :tipo_aula_id, :presence => true
	validates :dia, :presence => true
	validates :ginasio_id, :presence => true

	validates_uniqueness_of :staff_id, :scope => [:turno_id, :dia]
	validates_uniqueness_of :estudio_id, :scope => [:turno_id, :dia]

	def diaFormatado

		@dias =  [ 'Segunda' , 'Terca', 'Quarta', 'Quinta', 'Sexta', 'Sabado', 'Domingo' ]

		if dia != nil
			@dias[dia]
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
			xml.data Time.now
			xml.dia dia
			xml.hora Turno.find(turno_id).horaFormatada
			xml.ginasio Ginasio.find(ginasio_id).nome
			xml.estudio Estudio.find(estudio_id).nome
			xml.staff User.find(staff_id).nome
			xml.modalidade TipoAula.find(tipo_aula_id).tipo
		end
	end 

end
