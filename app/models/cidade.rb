class Cidade < ActiveRecord::Base

  geocoded_by :nome
  after_validation :geocode

  validates_presence_of :nome, :message => "em branco. Introduza um nome valido."
  validates_uniqueness_of :nome, :message => "ja existe na base de dados."

end

