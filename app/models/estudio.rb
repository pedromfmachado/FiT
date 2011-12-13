class Estudio < ActiveRecord::Base
	
	belongs_to :ginasio

	validates :nome, :presence => true
	validates :lotacao, :presence => true

end
