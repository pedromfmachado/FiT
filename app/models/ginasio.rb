class Ginasio < ActiveRecord::Base

	has_many :users
        has_many :pedido_planos
 	has_many :estudios
	has_many :aulas

	attr_accessible :nome,:morada, :telefone

	geocoded_by :morada
	after_validation :geocode

	# validacoes
	validates :morada, :presence => true
	validates :nome, :presence => true
	validates :telefone, :presence => true
end
