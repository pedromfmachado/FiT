class TipoAula < ActiveRecord::Base

	validates :tipo, :presence => true
	validates :descricao, :presence => true
end
