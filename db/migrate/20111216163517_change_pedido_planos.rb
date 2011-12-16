class ChangePedidoPlanos < ActiveRecord::Migration
  def change
  
    remove_column :pedido_planos, :ginasio_id
    remove_column :pedido_planos, :user_id
    add_column :pedido_planos, :user_id, :integer, :primary_key => true


  end
end
