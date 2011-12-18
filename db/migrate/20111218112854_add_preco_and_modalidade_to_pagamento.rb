class AddPrecoAndModalidadeToPagamento < ActiveRecord::Migration
  def change
    add_column :pagamentos, :preco, :float
    add_column :pagamentos, :modalidade_pagamento_id, :integer
  end
end
