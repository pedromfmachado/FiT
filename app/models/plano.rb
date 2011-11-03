class Plano < ActiveRecord::Base

	has_many :exercicios_planoss
	has_many :exercicios, :through => :exercicios_planoss
  belongs_to :user

end
