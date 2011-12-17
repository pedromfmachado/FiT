class ExerciciosPlanos < ActiveRecord::Base
  belongs_to :plano
  belongs_to :exercicio

  validates_presence_of :plano_id, :message => "em branco."
  validates_presence_of :exercicio_id, :message => "em branco."
  validates_presence_of :peso, :message => "em branco."
  validates_presence_of :series, :message => "em branco."
  validates_presence_of :repeticoes, :message => "em branco."
end

