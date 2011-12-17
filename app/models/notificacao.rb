class Notificacao < ActiveRecord::Base

  belongs_to :admin

  validates_presence_of :titulo, :message => "em branco."
  validates_presence_of :texto, :message => "em branco."
  validates_presence_of :admin_id, :message => "em branco."

end

