class Ginasio < ActiveRecord::Base

	has_many :users
	has_many :ginasio_notificacaos
	has_many :notificacaos, :through => :ginasio_notificacaos

	attr_accessible :nome,:morada, :telefone

	geocoded_by :morada
	after_validation :geocode

	# validacoes
	validates :morada, :presence => true
	validates :nome, :presence => true
end
