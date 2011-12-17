class Ginasio < ActiveRecord::Base

  has_many :users
  has_many :pedido_planos
  has_many :estudios
  has_many :aulas

  attr_accessible :nome, :morada, :telefone

  geocoded_by :morada
  after_validation :geocode

  validates_presence_of :nome, :message => "do ginasio esta em branco."
  validates_presence_of :telefone, :message => "em branco. Introduza o telefone do ginasio."
  validates_presence_of :morada, :message => "em branco. Introduza a morada."
end

