class AlimentarPlano < ActiveRecord::Base
	validates_presence_of :pequenoalmoco, :message => "em branco."
	validates_presence_of :manha, :message => "em branco."
	validates_presence_of :almoco, :message => "em branco."
	validates_presence_of :tarde, :message => "em branco."
	validates_presence_of :jantar, :message => "em branco."
	validates_presence_of :ceia, :message => "em branco."
	validates_presence_of :user_id, :message => "tem de associar um utilizador."
end
