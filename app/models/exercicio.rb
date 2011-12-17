class Exercicio < ActiveRecord::Base

  has_many :exercicios_planoss
  has_many :planos, :through => :exercicios_planoss

  validates_presence_of :nome, :message => "em branco. Introduza o nome do exercicio."
  validates_presence_of :maquina, :message => "em branco. Introduza uma maquina."
  validates_presence_of :tipo, :message => "em branco."

end

