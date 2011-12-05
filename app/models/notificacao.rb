class Notificacao < ActiveRecord::Base

	belongs_to :admin

	#validacoes
	validates :titulo, :presence => true
	validates :texto, :presence => true

end
