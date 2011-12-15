class PedidoPlano < ActiveRecord::Base
  belongs_to :user
  belongs_to :ginasio
  validates :user_id, :uniqueness => {
    :scope => :ginasio_id,
    :message => "apenas pode haver um pedido por utilizador"
  }
end
