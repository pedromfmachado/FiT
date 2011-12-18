class AddModalidadePagamentoIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :modalidade_pagamento_id, :integer
  end
end
