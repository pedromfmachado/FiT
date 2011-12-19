class PedidoPlano < ActiveRecord::Base
  
  belongs_to :user

  validates_presence_of :data_pedido, :message => "em branco."
  validates_presence_of :user_id, :message => "em branco."
  validates_uniqueness_of :user_id, :message => "so pode fazer um pedido de cada vez."

end

