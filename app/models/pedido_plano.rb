class PedidoPlano < ActiveRecord::Base
  
  belongs_to :user
  validates_uniqueness_of :user_id, :message => "so pode fazer um pedido de cada vez."

end

