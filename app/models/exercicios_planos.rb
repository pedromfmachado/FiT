class ExerciciosPlanos < ActiveRecord::Base
  belongs_to :plano
  belongs_to :exercicio

  validates_presence_of :plano_id, :message => "em branco."
  validates_presence_of :exercicio_id, :message => "em branco."

  validates_uniqueness_of :exercicio_id, :scope => :exercicio_id, :message => "violacao no par plano-exercicio"

  validates_presence_of :peso, :message => "em branco."
  validates_presence_of :series, :message => "em branco."

end

