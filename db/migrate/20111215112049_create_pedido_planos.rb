class CreatePedidoPlanos < ActiveRecord::Migration
  def change
    create_table :pedido_planos, :id => false do |t|
      t.integer :user_id
      t.datetime :data_pedido

      t.timestamps
    end
  end
end
