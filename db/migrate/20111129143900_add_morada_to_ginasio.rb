class AddMoradaToGinasio < ActiveRecord::Migration
  def change
    add_column :ginasios, :morada, :string
  end
end
