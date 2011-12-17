class Notificacao < ActiveRecord::Base

  belongs_to :admin

  validates_presence_of :titulo, :message => "em branco. Introduza o titulo da notificacao."
  validates_presence_of :texto, :message => "em branco. Escreva a mensagem que pretende divulgar."
  validates_presence_of :admin_id, :message => "em branco."

end

