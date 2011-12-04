class Cidade < ActiveRecord::Base

  geocoded_by :nome
	after_validation :geocode

  validates :nome, :presence => true, :uniqueness => true

end
