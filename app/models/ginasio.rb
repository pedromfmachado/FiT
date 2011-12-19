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
  validates_format_of :telefone, :unless => Proc.new { |ginasio| ginasio.telefone.blank? },
    :with => /^((\+351|00351|351)(\s{1})?)?(2\d{1}|(9(3|6|2|1)))\d{7}$/,
    :message => "invalido. Introduza um numero de telefone valido."

  validates_presence_of :morada, :message => "em branco. Introduza a morada."
end

