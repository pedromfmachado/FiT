class AddTelefoneToGinasio < ActiveRecord::Migration
  def change
    add_column :ginasios, :telefone, :string
  end
end
