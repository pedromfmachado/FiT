class TipoAula < ActiveRecord::Base
  validates_presence_of :tipo, :message => "em branco."
  validates_presence_of :descricao, :message =>"em branco."

end

