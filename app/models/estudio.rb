class Estudio < ActiveRecord::Base
	
  belongs_to :ginasio

  validates_presence_of :nome, :message => "em branco. Introduza um nome valido."
  validates_presence_of :lotacao, :message => "em branco. Introduza a lotacao do estudio."
  validates_numericality_of :lotacao, :message => "invalida. Introduza a lotacao do estudio.",
    :only_integer => true,
    :greater_than_or_equal_to => 0,
    :unless => Proc.new { |estudio| estudio.lotacao.blank? }

end

