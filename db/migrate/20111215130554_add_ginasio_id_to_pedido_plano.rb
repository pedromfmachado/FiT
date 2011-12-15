class AddGinasioIdToPedidoPlano < ActiveRecord::Migration
  def change
    add_column :pedido_planos, :ginasio_id, :integer
  end
end
