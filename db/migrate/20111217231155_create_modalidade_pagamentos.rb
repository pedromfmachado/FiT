class CreateModalidadePagamentos < ActiveRecord::Migration
  def change
    create_table :modalidade_pagamentos do |t|

      t.string :nome
      t.float :preco
      t.timestamps
    end
  end
end
