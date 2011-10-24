class ExerciciosPlanos < ActiveRecord::Base
  belongs_to :plano
  belongs_to :exercicio
end
