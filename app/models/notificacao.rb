class Notificacao < ActiveRecord::Base

	belongs_to :admin
	has_many :ginasio_notificacaos
	has_many :notificacaos, :through => :ginasio_notificacaos

	#validacoes
	validates :titulo, :presence => true
	validates :texto, :presence => true

end
